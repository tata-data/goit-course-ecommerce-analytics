# stackoverflow-python-survey-analysis

Educational data analysis project based on the Stack Overflow Developer Survey 2025.  
This notebook was created as part of the GoIT Data Analyst course.

Data  
- Stack Overflow Developer Survey 2025 (official annual survey of developers)
- Two CSV files: main survey results and a schema file with question descriptions  
  (stored as ZIP archives in this repo due to file size)

Goal  
Practice exploratory data analysis in Python on a real-world survey dataset:
- learn to work with a wide table (49 191 rows, 170+ columns)
- handle missing values
- answer a few focused business/research questions
- combine code, charts and narrative conclusions in one notebook

Files  
- `stackoverflow_survey_analysis.ipynb` – main Jupyter Notebook with code, charts and commentary  
- `survey_results_public.csv.zip` – compressed main survey data  
- `survey_results_schema.csv.zip` – compressed schema with question descriptions  
- `README.md` – project description

Key questions answered in the notebook  

1. Data structure and completeness  
   - How many unique respondents are there in the survey?  
   - How many questions (columns) are actually present in the data?  
   - Are there respondents who answered all questions?  
   - Which columns have the most missing values?

2. Work experience  
   - What are the mean, median and mode of work experience (`WorkExp`)?  
   - Does the survey mostly represent junior or experienced developers?

3. Remote work  
   - What share of respondents work fully remotely (`RemoteWork = 'Remote'`)?  

4. Python popularity  
   - What percentage of respondents have worked with Python in the last year  
     (`LanguageHaveWorkedWith` column)?

5. Learning paths  
   - How many respondents mention online courses as a way they learned to code  
     (`LearnCode` column, option “online courses or certification”)?

6. Compensation of Python developers by country  
   - Among respondents who work with Python, what are the mean and median yearly compensation  
     (`ConvertedCompYearly`) by country?  
   - Which countries form the top-10 by median compensation?  
   - Where is the gap between mean and median especially large (possible outliers)?

7. Education and compensation  
   - How does yearly compensation vary by formal education level (`EdLevel`)?  
   - For each education level, what are the mean, median and number of respondents?  
   - Is higher formal education associated with higher median compensation?

Tools and libraries  
- Python, Jupyter Notebook  
- pandas, NumPy  
- matplotlib (basic visualisation)

Short summary of findings  

- The dataset contains 49 191 unique respondents and more than 170 columns.  
  There are no respondents who answered all questions, which is typical for long surveys.  
- The average work experience is around 13 years, median 10 years,  
  so the survey mostly reflects the opinions of experienced developers rather than juniors.  
- Roughly a quarter of respondents work fully remotely.  
- About one third of respondents (around 37.5 %) report working with Python,  
  confirming its status as one of the most popular programming languages.  
- Online courses are a common way to learn programming: more than ten thousand respondents  
  mention them as a learning path.  
- Among Python developers, the highest median yearly compensation is observed in the USA,  
  Israel, Switzerland and Ireland.  
- Median compensation generally increases with higher formal education,  
  although outliers in some groups create a gap between mean and median,  
  so the median is a better descriptor of “typical” pay.

---

## Опис українською

Цей ноутбук – навчальний проєкт у межах курсу GoIT з аналізу даних з використанням Python.  
Я працюю з реальним датасетом Stack Overflow Developer Survey 2025 (49 191 респондент, понад 170 колонок).

Мета роботи – попрактикувати exploratory data analysis: подивитися на структуру даних, заповненість анкет, досвід роботи, використання Python, формат роботи (remote), навчання через онлайн-курси, а також компенсацію в розрізі країн та рівнів освіти.

Основні кроки в ноутбуці:
- завантаження двох CSV-файлів (результати опитування і schema) в pandas
- базова розвідка: `shape`, `info()`, аналіз пропусків, перегляд перших рядків
- перевірка унікальної кількості респондентів за `ResponseId`
- побудова окремого датафрейму з колонок-запитань і аналіз повноти анкет
- розрахунок середнього, медіани та моди для `WorkExp`
- підрахунок частки респондентів, що працюють віддалено (`RemoteWork`)
- оцінка популярності Python через колонку `LanguageHaveWorkedWith`
- аналіз шляхів навчання (онлайн-курси через `LearnCode`)
- аналіз компенсації Python-розробників у розрізі країн  
  (групування, фільтр по кількості спостережень, топ-10 країн, горизонтальний барчарт)
- аналіз зв’язку між рівнем освіти (`EdLevel`) і компенсацією  
  (mean, median, count, сортування, візуалізація)

Підсумково:
- жоден респондент не відповів на всі запитання анкети,  
  тому з даними потрібно працювати з урахуванням пропусків
- середній досвід роботи ≈ 13 років, медіанний 10 років – переважають досвідчені спеціалісти
- близько чверті респондентів працюють повністю віддалено
- приблизно 37.5 % респондентів зазначили, що працювали з Python протягом останнього року
- онлайн-курси є поширеним шляхом навчання програмуванню
- найвищу медіанну річну компенсацію серед Python-розробників мають США, Ізраїль, Швейцарія та Ірландія
- медіанна компенсація зростає разом з рівнем формальної освіти,  
  хоча окремі групи мають сильні викиди, через що середнє може бути значно вищим за медіану
