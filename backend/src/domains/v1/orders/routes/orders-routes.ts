import { Router } from 'express';
import { container } from 'tsyringe';
import { routeAdapter } from '../../../../app/adapters';
import { OrderController } from '../controllers';

const controller: OrderController = container.resolve('OrderController');

export default (router: Router): void => {
  router.get('/v1/orders', [
    routeAdapter(controller.getOrders),
  ]);
}
