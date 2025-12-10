import { fakerPL as faker  } from '@faker-js/faker';
import type { Customer, Offer, Entry, Membership } from './types/DBTypes';
import predefinedOffers from './offersConst';

export const LIMIT_CUSTOMERS = 50;
export const LIMIT_MEMBERSHIPS = 200;
export const LIMIT_ENTRIES = 400;

const asDateISO = (d: Date) => d.toISOString();
const randomInt = (min: number, max: number) =>
  Math.floor(faker.number.int({ min, max }));

const safeBetweenDates = (a: Date, b: Date) => {
  let from = a < b ? a : b;
  let to = a < b ? b : a;
  if (from.getTime() === to.getTime()) {
    to = new Date(from.getTime() + 1000);
  }
  return faker.date.between({ from, to });
};

const chooseNationality = () => {
  const r = randomInt(1, 100);
  if (r <= 70) return 'Polska';
  if (r <= 85) return 'Ukraina';
  if (r <= 92) return 'Niemcy';
  return 'Białoruś';
};

export function createCustomer(id: number): Customer {
  const first_name = faker.person.firstName();
  const last_name = faker.person.lastName();
  const birth = faker.date.birthdate({ min: 16, max: 62, mode: 'age' });
  const birth_date = birth.toISOString().slice(0, 10);
  const nationality = chooseNationality();
  const created_at = asDateISO(faker.date.recent({ days: 365 }));

  return {
    id,
    first_name,
    last_name,
    birth_date,
    nationality,
    created_at,
  };
}

export function createMembership(
  id: number,
  customerIds: number[],
  offerIds: number[],
): Membership {
  const customer_id = faker.helpers.arrayElement(customerIds);
  const offer_id = faker.helpers.arrayElement(offerIds);
  const from = safeBetweenDates(faker.date.past({ years: 1 }), new Date());
  const valid_from = from.toISOString().slice(0, 10);
  const addDays = randomInt(1, 365);
  const toDate = new Date(from);
  toDate.setDate(toDate.getDate() + addDays);
  const valid_to = toDate.toISOString().slice(0, 10);
  const created_at = asDateISO(from);

  return {
    id,
    customer_id,
    offer_id,
    valid_from,
    valid_to,
    created_at,
  };
}

export function createEntry(id: number, customerIds: number[]): Entry {
  const customer_id = faker.helpers.arrayElement(customerIds);
  const dayRoll = randomInt(1, 100);
  let targetWeekday: number;
  if (dayRoll <= 35) targetWeekday = 2; // Tuesday
  else if (dayRoll <= 65) targetWeekday = 6; // Saturday
  else if (dayRoll <= 90) targetWeekday = 0; // Sunday
  else targetWeekday = randomInt(1, 5); // Mon/Wed/Thu/Fri


  const today = new Date();
  const randomDays = randomInt(0, 358);
  const candidate = new Date(today.getTime() - randomDays * 24 * 3600 * 1000);
  const diff = (candidate.getDay() - targetWeekday + 7) % 7;
  const baseDate = new Date(candidate.getTime() - diff * 24 * 3600 * 1000);

  const roll = randomInt(1, 100);
  let hour: number;
  if (roll <= 60) hour = randomInt(16, 18);
  else if (roll <= 90) {
    const before = randomInt(6, 15);
    const after = randomInt(19, 20);
    hour = faker.datatype.boolean(0.5) ? before : after;
  } else hour = randomInt(0, 23);

  const minute = randomInt(0, 59);
  const second = randomInt(0, 59);
  const enteredDate = new Date(baseDate.getTime());
  enteredDate.setHours(hour, minute, second, 0);
  const entered_at = asDateISO(enteredDate);


    const durHours = randomInt(1, 5);
    const durMinutes = randomInt(0, 59);
    const ms = durHours * 60 * 60 * 1000 + durMinutes * 60 * 1000;
    const exited_at = asDateISO(new Date(enteredDate.getTime() + ms));
  

  const created_at = entered_at;

  return {
    id,
    customer_id,
    entered_at,
    exited_at,
    created_at,
  };
}

export function generateCustomers(limit = LIMIT_CUSTOMERS): Customer[] {
  const out: Customer[] = [];
  for (let i = 1; i <= limit; i++) out.push(createCustomer(i));
  return out;
}

export function generateMemberships(
  customers: Customer[],
  offers: Offer[],
  limit = LIMIT_MEMBERSHIPS,
): Membership[] {
  const customerIds = customers.map((c) => c.id);
  const offerIds = offers.map((o) => o.id);
  const out: Membership[] = [];
  const hasActive = new Set<number>();
  const today = new Date();

  for (let i = 1; i <= limit; i++) {
    const customer_id = faker.helpers.arrayElement(customerIds);
    const offer_id = faker.helpers.arrayElement(offerIds);

    const canBeActive = !hasActive.has(customer_id);
    const makeActive = canBeActive && faker.datatype.boolean(0.4);

    let valid_from: string;
    let valid_to: string;
    if (makeActive) {
      const from = safeBetweenDates(faker.date.past({ years: 1 }), today);
      const to = safeBetweenDates(today, new Date(today.getTime() + 365 * 24 * 3600 * 1000));
      valid_from = from.toISOString().slice(0, 10);
      valid_to = to.toISOString().slice(0, 10);
      hasActive.add(customer_id);
    } else {
      if (faker.datatype.boolean(0.5)) {
        const to = safeBetweenDates(faker.date.past({ years: 1 }), new Date(today.getTime() - 24 * 3600 * 1000));
        const from = safeBetweenDates(faker.date.past({ years: 2 }), to);
        valid_from = from.toISOString().slice(0, 10);
        valid_to = to.toISOString().slice(0, 10);
      } else {
        const from = safeBetweenDates(new Date(today.getTime() + 24 * 3600 * 1000), new Date(today.getTime() + 365 * 24 * 3600 * 1000));
        const to = safeBetweenDates(from, new Date(from.getTime() + 365 * 24 * 3600 * 1000));
        valid_from = from.toISOString().slice(0, 10);
        valid_to = to.toISOString().slice(0, 10);
      }
    }

    const created_at = asDateISO(new Date());

    out.push({
      id: i,
      customer_id,
      offer_id,
      valid_from,
      valid_to,
      created_at,
    });
  }

  return out;
}

export function generateEntries(customers: Customer[], limit = LIMIT_ENTRIES): Entry[] {
  const customerIds = customers.map((c) => c.id);
  const out: Entry[] = [];
  for (let i = 1; i <= limit; i++) out.push(createEntry(i, customerIds));
  return out;
}

export function generateAll(opts?: {
  customers?: number;
  memberships?: number;
  entries?: number;
}) {
    const customers = generateCustomers(opts?.customers ?? LIMIT_CUSTOMERS);
    const offers = predefinedOffers;
    const memberships = generateMemberships(
        customers,
        offers,
        opts?.memberships ?? LIMIT_MEMBERSHIPS,
    );
    const entries = generateEntries(customers, opts?.entries ?? LIMIT_ENTRIES);

    return { customers, offers, memberships, entries };
}

export default {
  LIMIT_CUSTOMERS,
  LIMIT_MEMBERSHIPS,
  LIMIT_ENTRIES,
  createCustomer,
  createMembership,
  createEntry,
  generateCustomers,
  generateMemberships,
  generateEntries,
  generateAll,
};
