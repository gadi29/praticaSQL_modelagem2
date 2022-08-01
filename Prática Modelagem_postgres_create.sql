CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" CHAR(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" CHAR(24) NOT NULL
);



CREATE TABLE "products" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"description" TEXT,
	"mainImage" TEXT NOT NULL UNIQUE,
	"price" INTEGER NOT NULL,
	"clothingId" INTEGER REFERENCES "clothes"("id")
);



CREATE TABLE "productsImages" (
	"id" SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES "products"("id"),
	"image" TEXT NOT NULL UNIQUE
);



CREATE TABLE "clothes" (
	"id" SERIAL PRIMARY KEY,
	"size" TEXT NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES "clothingCategories"("id")
);



CREATE TABLE "clothingCategories" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);



CREATE TABLE "purchases" (
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"address" INTEGER NOT NULL REFERENCES "addresses"("id"),
	"date" TIMESTAMP NOT NULL DEFAULT NOW(),
	"currentState" TEXT NOT NULL DEFAULT 'create'
);



CREATE TABLE "addresses" (
	"id" SERIAL PRIMARY KEY,
	"userId" TEXT NOT NULL REFERENCES "users"("id"),
	"cep" TEXT NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL
);



CREATE TABLE "productsPurchases" (
	"id" SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES "products"("id"),
	"purchaseId" INTEGER NOT NULL REFERENCES "purchases"("id")
);
