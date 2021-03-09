# Testing out Github

Hello World. This is our new test.

Hello there!


## The user table
To flatten the specialised support learning item selected. Use the following code:
```
SELECT *except(behaviour_management, positiveBehaviourManagement, restrictivePractices, prescribedMedication, administerMedication), 
        IF(behaviour_management + positiveBehaviourManagement>0, 1, 0) behaviour_management, 
        -- -- optional output being the following that are selected seperately
        -- restrictivePractices, prescribedMedication, administerMedication
FROM
        (SELECT _id clientId,
              MAX(IF(ssItem = 1, 1, 0)) manual_handling,
              MAX(IF(ssItem = 2, 1, 0)) anaphylaxis,
              MAX(IF(ssItem = 3, 1, 0)) allergies,
              MAX(IF(ssItem = 4, 1, 0)) epilepsy_or_seizures,
              MAX(IF(ssItem = 5, 1, 0)) PEG_feeding,
              MAX(IF(ssItem = 6, 1, 0)) catheter_care,
              MAX(IF(ssItem = 7, 1, 0)) medication_management,
              MAX(IF(ssItem = 8, 1, 0)) mealtime_management,
              MAX(IF(ssItem = 9, 1, 0)) swallowing_and_nutrition,
              MAX(IF(ssItem = 10, 1, 0)) bowel_care,
              MAX(IF(ssItem = 11, 1, 0)) diabetes_management,
              MAX(IF(ssItem = 12, 1, 0)) behaviour_management,
              MAX(IF(ssItem = 13, 1, 0)) asthma,
              MAX(IF(ssItem = 14, 1, 0)) mental_health,
              MAX(IF(ssItem = 15, 1, 0)) other,

        FROM (SELECT DISTINCT _id, ssItem
              FROM `x.user`
              CROSS JOIN UNNEST( profile.supportAreas.ss.items ) AS ssItem
              )
        GROUP BY 1)
        
LEFT JOIN (SELECT _id clientId, IF(profile.positiveBehaviourManagement=True, 1, 0) positiveBehaviourManagement, 
                  IF(profile.restrictivePractices = True, 1, 0) restrictivePractices, 
                  IF(profile.prescribedMedication = True, 1, 0) prescribedMedication,
                  IF(profile.administerMedication = True, 1, 0) administerMedication
            FROM `x.user`) USING (clientId) 
```
The link to the [script](decoder_ss_flattened_table.sql)

Once the connection to Bigquery was ready, one may call from the commend line to run the script.
```$ reserved code ```


To see optional items such as restrictive practices, simply uncomment the forth line of the code. 

You may also have a table to list the mapping code:
| item id | Description |
| --- | --- |
| 1 | manual_handling |
| 2 | anaphylaxis |
| 3 | allergies |

Alternative, you can insert a line of code like this

```SELECT CURRENT_DATE() ```

# The python Script
The code block also works with python code, so you can work with a variety of codes.
```
import pandas as pd
import numpy as np

dt = pd.DataFrame([[1, 2, 3], [4, 5, 6]], columns = ['a', 'b'])

dt.show()

for c in dt.columns:
    print(c)

```

We can also create a bullet list or numbered list like below:
a bullet list:
* item a
* item b

a numerical list:
1. part 1
2. part 2

We can also insert a link like this [here is a reference on how the basic syntax of markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
