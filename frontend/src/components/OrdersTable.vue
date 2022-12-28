<template>
  <div class="content-bound">
    <PageHeader />
    <div class="content-wrapper">
      <section class="table-title-section">
        <h3 class="table-title">
          <img src="../assets/shake-hands2.svg" alt="shake hands icon" /> Notas fiscais
        </h3>
        <p class="table-phrase">Visualize as notas fiscais que você tem.</p>
      </section>
      <div class="table-wrapper">
        <thead>
          <th>NOTA FISCAL</th>
          <th>SACADO</th>
          <th>CEDENTE</th>
          <th>EMISSÃO</th>
          <th>VALOR</th>
          <th>STATUS</th>
        </thead>
        <tbody v-for="order in orders" :key="order.id">
          <tr class="order-table-row">
            <td>{{ order.nNf }}</td>
            <td>{{ order.buyer.name }}</td>
            <td>{{ order.provider.name }}</td>
            <td>{{ order.emissionDate }}</td>
            <td>{{ order.value.toLocaleString('pt-br',{ style: 'currency', currency: 'BRL' }) }}</td>
            <td>{{ order.orderStatusBuyer >= 0 && order.orderStatusBuyer < 9 ? orderStatus[order.orderStatusBuyer] : 'Status desconhecido' }}</td>
            <td>
              <div class="provider-data-button">
                <button @click="onClick">
                  Dados do cedente
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </div>
    </div>
  </div>
</template>

<script>
  import PageHeader from './PageHeader.vue';
  import moment from 'moment';

  export default {
    components: {
      PageHeader,
    },
    data() {
      return {
        orders: [],
        orderStatus: ['Pendente de confirmação', 'Pedido confirmado', 'Não reconhece o pedido', 'Mercadoria não recebida', 'Recebida com avaria', 'Devolvida', 'Recebida com devolução parcial', 'Recebida e confirmada', 'Pagamento Autorizado'],
      }
    },
    async created() {
      await this.getOrders();
    },
    methods: {
      formatDate(date) {
        return moment(date).format('DD/MM/YYYY');
      },
      async getOrders() {
        const API_BASE_URL = process.env.VUE_APP_BACKEND_BASE_URL || 'http://localhost:3001';
        const response = await fetch(`${API_BASE_URL}/orders-api/v1/orders`);
        const bodyResponse = await response.json();
        this.orders = bodyResponse.map((order) => {
          order.emissionDate = this.formatDate(order.emissionDate);

          return order;
        });
      },
      onClick() {
        console.log('clicou!');
      }
    },
  }
</script>

<style>
  html, body {
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
  }

  .content-bound {
    -webkit-box-shadow: 30px 30px 30px 30px rgba(0,0,0,0.2);
    box-shadow: 30px 30px 30px 30px rgba(0,0,0,0.2);
    width: 85%;
    height: 100vh;
    border-radius: 1px;
  }

  .content-wrapper {
    width: 100%;
  }

  .table-title-section {
    width: 80%;
    height: 53px;
    margin: 3% 0 0 5%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 5px;
  }

  .table-title {
    font-weight: 700;
    font-size: 24px;
    line-height: 28px;
    margin: 0;
    padding: 0;
  }

  .table-phrase {
    font-weight: 400;
    font-size: 14px;
    margin: 0;
    padding: 0;
  }

  .table-wrapper {
    width: 90%;
    margin: 3% 0 0 5%;
    display: flex;

    flex-direction: column;
  }

  thead {
    width: 100%;
    display: flex;
    margin-bottom: 1%;
  }

  tr {
    width: 80%;
    display: block;
    margin: 5px;
  }

  th {
    font-weight: 700;
    font-size: 12px;
    line-height: 15.62px;
    color: #A1A8B8;
    margin: 0;
    padding: 0;
    text-align: start;
    width: 14%;
  }

  th:first-child {
    margin-left: 25px;
  }

  th:last-child {
    margin-left: 25px;
  }

  td {
    font-weight: 500;
    font-size: 14px;
    font-style: normal;
    line-height: 18px;
    color: #4D5566;
    width: 5%;
    height: 48px;
  }

  .order-table-row {
    border: 0.5px solid #A1A8B8;
    border-radius: 10px;
    padding-left: 20px;
    width: 100%;
  }

  .provider-data-button {
    width: 80%;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .provider-data-button > button {
    border-radius: 15px;
    width: 90%;
    padding: 4%;

    font-weight: 700;
    font-size: 12px;
    font-style: normal;
    line-height: 16px;
    color: #727D94;

    background-color: transparent;
    border: 0.5px solid #727D94;
  }
</style>
