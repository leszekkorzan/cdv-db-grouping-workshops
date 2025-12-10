/** customers table */
export interface Customer {
	/** primary key */
	id: number;
	first_name: string;
	last_name: string;
	/** DATE column (ISO string) */
	birth_date: string;
	nationality: string
	/** TIMESTAMP default NOW() (ISO string) */
	created_at?: string;
}

/** offers table */
export interface Offer {
	id: number;
	name: string;
	/** NUMERIC(10,2) - represented as number in TypeScript */
	price: number;
	days_valid: number;
	created_at?: string;
}

/** memberships table */
export interface Membership {
	id: number;
	customer_id: number; // FK -> customers(id)
	offer_id: number; // FK -> offers(id)
	/** DATE columns (ISO strings) */
	valid_from: string;
	valid_to: string;
	created_at?: string;
}

/** entries table */
export interface Entry {
	id: number;
	customer_id: number; // FK -> customers(id)
	/** TIMESTAMP columns (ISO strings) */
	entered_at: string;
	/** nullable TIMESTAMP */
	exited_at?: string | null;
	created_at?: string;
}

// Convenience union/type exports (optional)
export type DBCustomer = Customer;
export type DBOffer = Offer;
export type DBMembership = Membership;
export type DBEntry = Entry;

