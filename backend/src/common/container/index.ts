import { container } from 'tsyringe';
import { OrderRepository } from '../../domains/v1/orders/repositories';
import { OrderService } from '../../domains/v1/orders/services';
import { OrderController } from '../../domains/v1/orders/controllers';

container.register<OrderRepository>('OrderRepository', OrderRepository);
container.register<OrderService>('OrderService', OrderService);
container.register<OrderController>('OrderController', OrderController);
