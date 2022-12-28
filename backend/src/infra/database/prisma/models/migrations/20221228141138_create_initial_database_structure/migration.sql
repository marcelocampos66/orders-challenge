-- CreateTable
CREATE TABLE "cnpjs" (
    "id" SERIAL NOT NULL,
    "cnpj" VARCHAR(255) NOT NULL,
    "companyType" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cnpjs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "buyers" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "tradingName" VARCHAR(255),
    "cashforceTax" VARCHAR(255),
    "responsibleName" VARCHAR(255),
    "responsibleEmail" VARCHAR(255),
    "responsiblePosition" VARCHAR(255),
    "responsiblePhone" VARCHAR(255),
    "responsibleMobile" VARCHAR(255),
    "website" VARCHAR(255),
    "postalCode" VARCHAR(255),
    "address" VARCHAR(255),
    "number" VARCHAR(255),
    "complement" VARCHAR(255),
    "neighborhood" VARCHAR(255),
    "city" VARCHAR(255),
    "state" VARCHAR(255),
    "phoneNumber" VARCHAR(255),
    "situation" VARCHAR(255),
    "situationDate" VARCHAR(255),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "confirm" BOOLEAN NOT NULL DEFAULT true,
    "email" VARCHAR(255),
    "cnpjId" INTEGER NOT NULL,

    CONSTRAINT "buyers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "offers" (
    "id" SERIAL NOT NULL,
    "tax" VARCHAR(255) NOT NULL,
    "tariff" VARCHAR(255) NOT NULL,
    "adValorem" VARCHAR(255) NOT NULL,
    "float" VARCHAR(255) NOT NULL,
    "iof" VARCHAR(255) NOT NULL,
    "expiresIn" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "paymentStatusSponsor" BOOLEAN NOT NULL DEFAULT false,
    "paymentStatusProvider" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "orderId" INTEGER,
    "sponsorId" INTEGER,

    CONSTRAINT "offers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orderportions" (
    "id" SERIAL NOT NULL,
    "nDup" VARCHAR(255) NOT NULL,
    "dVenc" VARCHAR(255) NOT NULL,
    "vDup" VARCHAR(255) NOT NULL,
    "availableToMarket" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "orderId" INTEGER,

    CONSTRAINT "orderportions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orders" (
    "id" SERIAL NOT NULL,
    "orderNfId" VARCHAR(255) NOT NULL,
    "orderNumber" VARCHAR(255) NOT NULL,
    "orderPath" VARCHAR(255),
    "orderFileName" VARCHAR(255),
    "orderOriginalName" VARCHAR(255),
    "emissionDate" VARCHAR(255),
    "pdfFile" VARCHAR(255),
    "emitedTo" VARCHAR(255) NOT NULL,
    "nNf" VARCHAR(255),
    "CTE" VARCHAR(255),
    "value" INTEGER,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cnpjId" INTEGER,
    "userId" INTEGER,
    "buyerId" INTEGER,
    "providerId" INTEGER,
    "orderStatusBuyer" INTEGER NOT NULL DEFAULT 0,
    "orderStatusProvider" INTEGER NOT NULL DEFAULT 0,
    "deliveryReceipt" VARCHAR(255),
    "cargoPackingList" VARCHAR(255),
    "deliveryCtrc" VARCHAR(255),

    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "providers" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "tradingName" VARCHAR(255),
    "cashforceTax" VARCHAR(255),
    "responsibleName" VARCHAR(255),
    "responsibleEmail" VARCHAR(255),
    "responsiblePosition" VARCHAR(255),
    "responsiblePhone" VARCHAR(255),
    "responsibleMobile" VARCHAR(255),
    "website" VARCHAR(255),
    "postalCode" VARCHAR(255),
    "address" VARCHAR(255),
    "number" VARCHAR(255),
    "complement" VARCHAR(255),
    "neighborhood" VARCHAR(255),
    "city" VARCHAR(255),
    "state" VARCHAR(255),
    "bank" VARCHAR(255),
    "bankAgency" VARCHAR(255),
    "account" VARCHAR(255),
    "documents" VARCHAR(255),
    "phoneNumber" VARCHAR(255),
    "situation" VARCHAR(255),
    "situationDate" VARCHAR(255),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" VARCHAR(255),
    "cnpjId" INTEGER NOT NULL,

    CONSTRAINT "providers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sponsors" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "tradingName" VARCHAR(255),
    "cashforceTax" VARCHAR(255),
    "responsibleName" VARCHAR(255),
    "responsibleEmail" VARCHAR(255),
    "responsiblePosition" VARCHAR(255),
    "responsiblePhone" VARCHAR(255),
    "responsibleMobile" VARCHAR(255),
    "website" VARCHAR(255),
    "postalCode" VARCHAR(255),
    "address" VARCHAR(255),
    "number" VARCHAR(255),
    "complement" VARCHAR(255),
    "neighborhood" VARCHAR(255),
    "city" VARCHAR(255),
    "state" VARCHAR(255),
    "bank" VARCHAR(255),
    "bankAgency" VARCHAR(255),
    "account" VARCHAR(255),
    "phoneNumber" VARCHAR(255),
    "situation" VARCHAR(255),
    "situationDate" VARCHAR(255),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" VARCHAR(255),
    "cnpjId" INTEGER NOT NULL,

    CONSTRAINT "sponsors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phoneNumber" VARCHAR(255),
    "mobile" VARCHAR(255),
    "departament" VARCHAR(255),
    "verificationCode" VARCHAR(255),
    "emailChecked" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cashforceAdm" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cnpjs_cnpj_key" ON "cnpjs"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "orders_orderNfId_key" ON "orders"("orderNfId");

-- CreateIndex
CREATE UNIQUE INDEX "orders_orderPath_key" ON "orders"("orderPath");

-- CreateIndex
CREATE UNIQUE INDEX "orders_orderFileName_key" ON "orders"("orderFileName");

-- CreateIndex
CREATE UNIQUE INDEX "orders_orderOriginalName_key" ON "orders"("orderOriginalName");

-- AddForeignKey
ALTER TABLE "buyers" ADD CONSTRAINT "buyers_cnpjId_fkey" FOREIGN KEY ("cnpjId") REFERENCES "cnpjs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_cnpjId_fkey" FOREIGN KEY ("cnpjId") REFERENCES "cnpjs"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_buyerId_fkey" FOREIGN KEY ("buyerId") REFERENCES "buyers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "providers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "providers" ADD CONSTRAINT "providers_cnpjId_fkey" FOREIGN KEY ("cnpjId") REFERENCES "cnpjs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sponsors" ADD CONSTRAINT "sponsors_cnpjId_fkey" FOREIGN KEY ("cnpjId") REFERENCES "cnpjs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
