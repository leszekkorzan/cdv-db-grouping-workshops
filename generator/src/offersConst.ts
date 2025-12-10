import { Offer } from "./types/DBTypes";

export const predefinedOffers: Offer[] = [
	{
		id: 1,
		name: "Miesięczny Standard",
		price: 59.99,
		days_valid: 30,
		created_at: "2020-01-01T08:00:00Z",
	},
	{
		id: 2,
		name: "Kwartalny Plus",
		price: 159.99,
		days_valid: 90,
		created_at: "2020-01-01T08:00:00Z",
	},
	{
		id: 3,
		name: "Roczny Premium",
		price: 599.0,
		days_valid: 365,
		created_at: "2020-01-01T08:00:00Z",
	},
	{
		id: 4,
		name: "Tygodniowy Basic",
		price: 29.99,
		days_valid: 7,
		created_at: "2020-01-01T08:00:00Z",
	},
];

export default predefinedOffers;