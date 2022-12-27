import { prisma } from '../../client';

export const seedUsers = async () => {
  await prisma.user.createMany({
    data: [
      {
        id: 1,
        name: 'Admin Pereira',
        email: 'adminpereira@cashforce.com.br',
        verificationCode: '',
        emailChecked: true,
        cashforceAdm: true,
      },
    ],
    skipDuplicates: true,
  });
}
