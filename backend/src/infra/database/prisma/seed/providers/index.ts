import { prisma } from '../../client';

export const seedProviders = async () => {
  await prisma.provider.createMany({
    data: [
      {
        id: 1,
        name: 'CEDENTE 002',
        tradingName: 'CEDENTE 002 LTDA',
        cnpjId: 2,
      },
    ],
    skipDuplicates: true,
  })
}
