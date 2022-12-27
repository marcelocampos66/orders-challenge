import { injectable, inject } from 'tsyringe';
import { Controller } from '../../../../common/base';
import { HttpStatusCode } from '../../../../common/helpers/enum-helper';
import { OrderService } from '../services';

@injectable()
export class OrderController extends Controller {
  private readonly orderService: OrderService;

  constructor(
    @inject('OrderService') orderService: OrderService,
  ) {
    super();
    this.orderService = orderService;
    this.getOrders = this.getOrders.bind(this);
  }

  public async getOrders(_request: OrderController.GetOrdersRequest) {
    try {
      const orders = await this.orderService.getOrders();

      return this.httpResponse(HttpStatusCode.OK, orders);
    } catch (error) {
      return this.handleError(error);
    }
  }
}

declare namespace OrderController {
  export interface GetOrdersRequest {}
}
