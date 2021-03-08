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
              FROM `hireup-beta.hireup_prod.user`
              CROSS JOIN UNNEST( profile.supportAreas.ss.items ) AS ssItem
              )
        GROUP BY 1)
        
LEFT JOIN (SELECT _id clientId, IF(profile.positiveBehaviourManagement=True, 1, 0) positiveBehaviourManagement, 
                  IF(profile.restrictivePractices = True, 1, 0) restrictivePractices, 
                  IF(profile.prescribedMedication = True, 1, 0) prescribedMedication,
                  IF(profile.administerMedication = True, 1, 0) administerMedication
            FROM `hireup-beta.hireup_prod.user`) USING (clientId) 
