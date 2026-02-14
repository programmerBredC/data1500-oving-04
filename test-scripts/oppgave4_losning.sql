-- ============================================================================
-- TEST-SKRIPT FOR OPPGAVESETT 1.4: Databasemodellering og implementering
-- ============================================================================

-- Kjør med: docker-compose exec postgres psql -h -U admin -d data1500_db -f test-scripts/oppgave4_losning.sql

-- En test SQL-spørring mot metadata i PostgreSQL
select nspname as schema_name from pg_catalog.pg_namespace;

SELECT * FROM innlegg WHERE avsender IN (
        SELECT bruker_id FROM lærere
        )
    AND rom_id = 1 ORDER BY dato DESC LIMIT 3;

WITH RECURSIVE traad AS (
  SELECT * 
  FROM innlegg
  WHERE avsender = 2 AND opprinnelig_innlegg IS NULL

  UNION ALL

  SELECT i.*
  FROM innlegg i
  JOIN traad t ON i.opprinnelig_innlegg = t.innleggs_id
)
SELECT * FROM traad; 

SELECT * FROM elev_i_gruppe WHERE gruppe_id = 1

SELECT COUNT(gruppe_id) FROM grupper;