from django.db import connection, transaction
import os

os.environ['DJANGO_SETTINGS_MODULE'] = 'wordnik.settings'

cursor = connection.cursor()

query = """
BEGIN;
DROP TABLE "market_businessmodeldetails";
ALTER TABLE "market_businessmodel_comments" DROP CONSTRAINT "businessmodel_id_refs_id_dd753d81";
DROP TABLE "market_businessmodel";
DROP TABLE "market_businessmodel_comments";
DROP TABLE "market_metric";
DROP TABLE "market_metrictype";
ALTER TABLE "market_company_ecosystem" DROP CONSTRAINT "ecosystem_id_refs_id_7adbe209";
DROP TABLE "market_ecosystem";
ALTER TABLE "market_source_tags" DROP CONSTRAINT "source_id_refs_id_1f20cb66";
ALTER TABLE "market_source_company" DROP CONSTRAINT "source_id_refs_id_7d97ba91";
DROP TABLE "market_source";
DROP TABLE "market_source_tags";
DROP TABLE "market_source_company";
ALTER TABLE "market_productfeature_tags" DROP CONSTRAINT "productfeature_id_refs_id_db1ea0a";
DROP TABLE "market_productfeature";
DROP TABLE "market_productfeature_tags";
DROP TABLE "market_feature";
ALTER TABLE "market_product_tags" DROP CONSTRAINT "product_id_refs_id_47e5eb02";
DROP TABLE "market_product";
DROP TABLE "market_product_tags";
ALTER TABLE "market_company" DROP CONSTRAINT "parent_id_refs_id_fb936167";
ALTER TABLE "market_company_segments" DROP CONSTRAINT "company_id_refs_id_aa132695";
ALTER TABLE "market_company_ecosystem" DROP CONSTRAINT "company_id_refs_id_c5e948a4";
ALTER TABLE "market_company_tags" DROP CONSTRAINT "company_id_refs_id_e5d7a5be";
ALTER TABLE "market_exit" DROP CONSTRAINT "acquirer_id_refs_id_27ed64d7";
ALTER TABLE "market_exit" DROP CONSTRAINT "company_id_refs_id_27ed64d7";
ALTER TABLE "market_comment" DROP CONSTRAINT "company_id_refs_id_277314a1";
DROP TABLE "market_company";
DROP TABLE "market_company_segments";
DROP TABLE "market_company_ecosystem";
DROP TABLE "market_company_tags";
DROP TABLE "market_segment";
DROP TABLE "market_tag";
DROP TABLE "market_exit";
DROP TABLE "market_comment";
COMMIT;
"""

connection.execute(query)

transaction.commit_unless_managed()

