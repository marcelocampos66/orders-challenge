import { prisma } from '../../client';

export const seedBuyers = async () => {
  await prisma.buyer.createMany({
    data: [
      {
        id: 1,
        name: 'SACADO 001',
        tradingName: 'SACADO 001 LTDA',
        cashforceTax: '0',
        cnpjId: 1,
        confirm: true,
      }
    ],
    skipDuplicates: true,
  })
}
