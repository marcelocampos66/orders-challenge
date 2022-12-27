import { prisma } from '../../client';

export const seedCnpjs = async () => {
  await prisma.cnpj.createMany({
    data: [
      {
        id: 1,
        cnpj: '00000000000001',
        companyType: 2,
      },
      {
        id: 2,
        cnpj: '00000000000002',
        companyType: 1,
      }
    ],
    skipDuplicates: true
  });
};
