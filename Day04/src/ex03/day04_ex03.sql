SELECT generated_date AS missing_date FROM v_generated_dates
EXCEPT
SELECT visit_date FROM person_visits WHERE DATE_PART('month', visit_date) = 01
ORDER BY
    missing_date;