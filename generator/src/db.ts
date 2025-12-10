import { Client } from 'pg';
import type { Customer, Offer, Membership, Entry } from './types/DBTypes';

type AllData = {
  customers: Customer[];
  offers: Offer[];
  memberships: Membership[];
  entries: Entry[];
};


export async function importAllToDb(data: AllData) {
  const url = process.env.DATABASE_URL;
  if (!url) throw new Error('process.env.DATABASE_URL is not set');

  const client = new Client({ connectionString: url });
  await client.connect();

  try {
    await client.query('BEGIN');
    await client.query('TRUNCATE TABLE memberships, entries, offers, customers RESTART IDENTITY CASCADE');

    const bulkInsert = async (table: string, columns: string[], rows: any[]) => {
      if (rows.length === 0) return;
      const values: any[] = [];
      const rowPlaceholders: string[] = [];

      rows.forEach((r, i) => {
        const placeholderRow: string[] = [];
        columns.forEach((col) => {
          values.push((r as any)[col]);
          placeholderRow.push(`$${values.length}`);
        });
        rowPlaceholders.push(`(${placeholderRow.join(',')})`);
      });

      const text = `INSERT INTO ${table} (${columns.join(',')}) VALUES ${rowPlaceholders.join(',')}`;
      await client.query(text, values);
    };

    await bulkInsert(
      'customers',
      ['id', 'first_name', 'last_name', 'birth_date', 'nationality', 'created_at'],
      data.customers.map((c) => ({
        id: c.id,
        first_name: c.first_name,
        last_name: c.last_name,
        birth_date: c.birth_date,
        nationality: c.nationality,
        created_at: c.created_at ?? null,
      })),
    );

    await bulkInsert(
      'offers',
      ['id', 'name', 'price', 'days_valid', 'created_at'],
      data.offers.map((o) => ({
        id: o.id,
        name: o.name,
        price: o.price,
        days_valid: o.days_valid,
        created_at: o.created_at ?? null,
      })),
    );

    await bulkInsert(
      'memberships',
      ['id', 'customer_id', 'offer_id', 'valid_from', 'valid_to', 'created_at'],
      data.memberships.map((m) => ({
        id: m.id,
        customer_id: m.customer_id,
        offer_id: m.offer_id,
        valid_from: m.valid_from,
        valid_to: m.valid_to,
        created_at: m.created_at ?? null,
      })),
    );

    await bulkInsert(
      'entries',
      ['id', 'customer_id', 'entered_at', 'exited_at', 'created_at'],
      data.entries.map((e) => ({
        id: e.id,
        customer_id: e.customer_id,
        entered_at: e.entered_at,
        exited_at: e.exited_at ?? null,
        created_at: e.created_at ?? null,
      })),
    );

    await client.query('COMMIT');
  } catch (err) {
    await client.query('ROLLBACK');
    throw err;
  } finally {
    await client.end();
  }
}

export default { importAllToDb };
