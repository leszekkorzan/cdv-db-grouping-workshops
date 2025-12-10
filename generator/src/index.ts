import generator from "./generator";
import 'dotenv/config'
import dbImporter from './db';

async function start() {
    const res = generator.generateAll({ customers: 1000, memberships: 1600, entries: 8000 });

    try {
        console.log('Importing generated data into database...');
        await dbImporter.importAllToDb(res as any);
        console.log('Import finished successfully.');
    } catch (err) {
        console.error('Import failed:', err);
    }
}
start();