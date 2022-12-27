import { inject, injectable } from 'tsyringe';
import { OrderRepository } from '../repositories';

@injectable()
export class OrderService {
  private readonly orderRepository: OrderRepository;

  constructor(
    @inject('OrderRepository') orderRepository: OrderRepository,
  ) {
    this.orderRepository = orderRepository;
  }

  public async getOrders() {
    return this.orderRepository.getOrders();
  }
}
