import { httpResponse } from '../helpers/http-helper';
import { HttpStatusCode } from '../helpers/enum-helper';
import { HttpResponse } from '../protocols';

export class Controller {
  protected async httpResponse(status: number, body: unknown): Promise<HttpResponse> {
    return httpResponse(status, body);
  }

  protected async handleError(error: Error): Promise<HttpResponse> {
    return httpResponse(
      HttpStatusCode.INTERNAL_SERVER_ERROR,
      { error: error.message },
    );
  }
}