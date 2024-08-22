-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT false,
    "isFreeShipping" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "discountPercentage" INTEGER NOT NULL,
    "coverImages" TEXT[],
    "images" TEXT[],
    "stock" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductVariation" (
    "id" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "stock" INTEGER NOT NULL,
    "discountPercentage" INTEGER NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "ProductVariation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductVariationVariation" (
    "id" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,
    "variant" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "stock" INTEGER NOT NULL,
    "discountPercentage" INTEGER NOT NULL,
    "productVariantId" TEXT NOT NULL,

    CONSTRAINT "ProductVariationVariation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Product_slug_key" ON "Product"("slug");

-- AddForeignKey
ALTER TABLE "ProductVariation" ADD CONSTRAINT "ProductVariation_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductVariationVariation" ADD CONSTRAINT "ProductVariationVariation_productVariantId_fkey" FOREIGN KEY ("productVariantId") REFERENCES "ProductVariation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
