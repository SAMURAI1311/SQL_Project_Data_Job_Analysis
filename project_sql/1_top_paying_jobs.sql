/*
Задача: Какие самые оплачиваемые роли аналитиком данных?
- Найти топ 10, доступных удаленно
- Сфокусироваться на тех, где указана зарплата
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
Анализ 10 наиболее высокооплачиваемых вакансий Data Analyst за 2023 год
показывает значительный разброс годовых зарплат — от $184 000 до $650 000.

Самой высокооплачиваемой оказалась позиция Data Analyst в компании Mantys
с указанной средней годовой зарплатой $650 000. Эта вакансия значительно
выделяется среди остальных и может рассматриваться как выброс в выборке.

Вторая по уровню оплаты позиция — Director of Analytics в компании Meta
с зарплатой $336 500 в год. Остальные вакансии располагаются преимущественно
в диапазоне от $184 000 до $256 000 в год.

Средняя зарплата по всей десятке составляет около $264 500 в год, однако
на этот показатель сильно влияет вакансия Mantys с зарплатой $650 000.

Медианная зарплата составляет $211 000, поэтому она лучше отражает типичный
уровень оплаты среди рассмотренных наиболее высокооплачиваемых вакансий.

Если исключить самую высокую зарплату как потенциальный выброс, среднее
значение по оставшимся вакансиям снижается примерно до $221 700 в год.

В верхней части рейтинга заметна высокая доля руководящих и senior-позиций,
включая Director of Analytics, Associate Director и Principal Data Analyst.

Это показывает, что наиболее высокие зарплаты в аналитике данных связаны
не только с технической работой, но и с высоким уровнем ответственности,
опыта и влияния специалиста на бизнес-решения компании.

При этом в топ-10 присутствуют и позиции с обычным названием Data Analyst,
что показывает возможность достижения высокой компенсации и без перехода
исключительно на управленческие должности.

Все рассмотренные вакансии относятся к Full-time и имеют возможность
удалённой работы, что также является заметной особенностью этой выборки.

В целом анализ показывает, что наиболее высокооплачиваемые позиции
Data Analyst в 2023 году могут превышать $200 000 годового дохода,
а для senior, principal и руководящих ролей уровень компенсации может
быть существенно выше.

Таким образом, рост дохода аналитика данных связан с переходом от базовой
аналитической работы к более сложным задачам, высокой ответственности,
глубокой экспертизе и участию в принятии стратегических решений компании.

[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "company_name": "Get It Recruit - Information Technology"
  }
]
*/