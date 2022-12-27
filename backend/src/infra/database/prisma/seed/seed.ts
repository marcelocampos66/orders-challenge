import { seedBuyers } from './buyers';
import { seedCnpjs } from './cnpjs';
import { seedOrders } from './orders';
import { seedProviders } from './providers';
import { seedUsers } from './users';

const main = async () => {
  await seedCnpjs();
  await seedUsers();
  await seedBuyers();
  await seedProviders();
  await seedOrders();
}

main();
