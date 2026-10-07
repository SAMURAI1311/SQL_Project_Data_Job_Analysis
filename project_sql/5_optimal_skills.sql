-- Задача: Найти самые оптимальные навыки для изучения, сравнив оплату и востребованность

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY skills_dim.skill_id, skills_dim.skills
),
average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY skills_dim.skill_id, skills_dim.skills
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;

/*
Сравнение востребованности навыков и средней заработной платы показывает,
что навык с самой высокой зарплатой не всегда является лучшим для изучения.

Например, Go имеет самую высокую среднюю зарплату в представленной выборке —
около $115 320 в год, однако встречается только в 27 вакансиях.

Похожая ситуация наблюдается с Confluence, Hadoop и BigQuery: вакансии,
требующие эти навыки, имеют относительно высокую среднюю зарплату, но
количество таких предложений значительно ниже, чем у основных инструментов.

Наиболее интересным навыком с точки зрения сочетания востребованности
и уровня оплаты является Python.

Python встречается в 236 вакансиях — это максимальный показатель
в представленной выборке — при средней зарплате около $101 397 в год.

Очень похожую позицию занимает Tableau: навык встречается в 230 вакансиях,
а средняя зарплата составляет около $99 288 в год.

R также демонстрирует хороший баланс между спросом и оплатой:
148 вакансий со средней зарплатой около $100 499 в год.

Среди более специализированных технологий особенно выделяется Snowflake.
При 37 вакансиях его средняя зарплата достигает примерно $112 948,
что делает его одним из наиболее привлекательных дополнительных навыков.

Облачные платформы Azure и AWS также показывают хороший баланс.
Azure встречается в 34 вакансиях со средней зарплатой около $111 225,
а AWS — в 32 вакансиях со средней зарплатой около $108 317.

Среди BI-инструментов интересен Looker: он встречается в 49 вакансиях,
при этом средняя зарплата составляет около $103 795 в год.

Oracle также сочетает сравнительно высокую востребованность и оплату:
37 вакансий со средней заработной платой около $104 534 в год.

Таким образом, если учитывать одновременно количество вакансий и зарплату,
наиболее оптимальными навыками являются Python, Tableau и R благодаря
значительно более высокому спросу по сравнению с остальными технологиями.

Для дальнейшего расширения набора компетенций наиболее привлекательными
выглядят Snowflake, Azure, AWS и Looker, поскольку они встречаются реже,
но связаны с более высоким средним уровнем заработной платы.

Такие навыки, как Go, Hadoop и BigQuery, также показывают высокую оплату,
однако значительно меньшая востребованность делает их скорее инструментами
для специализации, чем универсальной основой для профессии Data Analyst.

В итоге наиболее рациональной стратегией является сочетание массовых
аналитических навыков с более специализированными технологиями.

Python и Tableau обеспечивают широкий выбор вакансий, а Snowflake,
AWS или Azure могут дополнить основной набор навыков и открыть доступ
к более техническим и высокооплачиваемым позициям.

Главный вывод анализа заключается в том, что при выборе навыков следует
ориентироваться не только на максимальную среднюю зарплату, но и на спрос.

Навык с немного меньшей средней зарплатой, но в несколько раз большим
числом вакансий может быть значительно более ценным для рынка труда.


[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]
*/