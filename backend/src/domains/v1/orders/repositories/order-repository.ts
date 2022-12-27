import { injectable } from 'tsyringe';
import { prisma } from '../../../../infra/database/prisma/client';

@injectable()
export class OrderRepository {
  public async getOrders() {
    return prisma.order.findMany({
      include: {
        cnpj: true,
        buyer: true,
        provider: true,
        user: true,
      },
    });
  }
}
