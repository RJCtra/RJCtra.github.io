--ALTER TABLE "visits" RENAME TO "swipes";
--ALTER TABLE "swipes" ADD COLUMN "ttpe" TEXT;
--ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";
ALTER TABLE "swipes" DROP COLUMN "ttpe";
