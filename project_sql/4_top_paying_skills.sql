-- Найти: Какие топовые навыки, связанные с более высокой средней зарплатой

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25

/*
Анализ навыков, связанных с наиболее высокой средней зарплатой Data Analyst,
показывает, что верхние позиции занимают преимущественно более технические
и специализированные технологии.

Самую высокую среднюю зарплату имеют вакансии, в которых требуется PySpark —
около $208 172 в год. Это значительно выше остальных навыков в выборке.

На втором месте находится Bitbucket со средней зарплатой около $189 155,
а далее следуют Couchbase и Watson — примерно по $160 515 в год.

Высокие значения также наблюдаются у DataRobot, GitLab, Swift и Jupyter,
для которых средняя зарплата находится примерно в диапазоне $153 000–155 000.

Среди инструментов, непосредственно связанных с анализом данных, особенно
выделяются Pandas со средней зарплатой около $151 821 и NumPy — $143 513.

Также высокие показатели имеют Databricks, Airflow, Scala и Kubernetes.
Большинство этих технологий связаны уже не только с классической аналитикой,
но и с обработкой больших данных, Data Engineering и инфраструктурой.

Это показывает, что более высокие зарплаты часто встречаются в вакансиях,
где от аналитика требуется работа со сложными системами обработки данных,
облачной инфраструктурой или инженерными инструментами.

Отдельно можно выделить PySpark, Databricks, Airflow и Scala, поскольку
они характерны для работы с большими объёмами данных и распределёнными
системами, что может соответствовать более техническим позициям.

Pandas, NumPy, Jupyter и Scikit-learn показывают высокую среднюю зарплату
для навыков, непосредственно связанных с Python и анализом данных.

При этом результаты не означают, что изучение конкретного навыка само
по себе приведёт к указанному уровню зарплаты.

Средняя зарплата также зависит от уровня позиции, опыта специалиста,
компании, набора остальных навыков и количества вакансий, в которых
встречается каждая технология.

Особенно осторожно следует интерпретировать редкие навыки, поскольку
небольшое число вакансий может значительно завысить среднее значение.

В целом анализ показывает, что наиболее высокие зарплаты связаны
преимущественно со специализированными техническими навыками на стыке
аналитики данных, Data Engineering, Big Data и современной инфраструктуры.

Таким образом, расширение классического набора SQL, Python и BI навыками
PySpark, Databricks, Airflow, облачных платформ и инженерных инструментов
характерно для более технических и потенциально более оплачиваемых ролей.


[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/