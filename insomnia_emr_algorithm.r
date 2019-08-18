################################################################################################
### This program calculates the probability for insomnia.                                    ###
### Kartoun U, Aggarwal R, Beam AL, Pai JK, Chatterjee A, Fitzgerald TP, Kohane IS, Shaw SY. ###
### Development of an algorithm to identify patients with physician-documented insomnia.     ###
### Sci Rep. 2018 May 18;8(1):7862. doi: 10.1038/s41598-018-25312-z.                         ###  
################################################################################################
rm(list=ls());
#########################################################################################
Insomnia_Probability_Threshold = 0.828209 #This is a constant that should not be modified.

### Specify values for any given patient.
Total_Number_of_ICD_codes_Insomnia_Structured = 0
Total_Number_of_ICD_codes_Anxiety_Depression_Structured = 5
Total_Number_of_ICD_codes_Joint_Disorder_Structured = 0
Total_Number_of_EMR_Data_Entries_Structured = 7369
Total_Number_of_Sleep_Prescriptions_Structured = 6
Total_Number_of_Notes_Sleep_Disorder_Untructured = 0
Total_Number_of_Notes_Psychiatric_Disorder_Untructured = 4

#########################################################################################

#Calculate probability for insomnia: 0.0 (no sleep disorder) to 1.0 (severe sleep disorder).
linear_part = -1.927027677 + 0.802462562 * Total_Number_of_ICD_codes_Insomnia_Structured + 0.264231683 * Total_Number_of_ICD_codes_Anxiety_Depression_Structured + 0.048271004 * Total_Number_of_ICD_codes_Joint_Disorder_Structured + 0.000231521 * Total_Number_of_EMR_Data_Entries_Structured + 0.086364249 * Total_Number_of_Sleep_Prescriptions_Structured + 2.32973859 * Total_Number_of_Notes_Sleep_Disorder_Untructured + 0.098835169 * Total_Number_of_Notes_Psychiatric_Disorder_Untructured
Insomnia_Probabiliy = exp(linear_part) /  (1 + exp(linear_part))

if (Insomnia_Probabiliy > Insomnia_Probability_Threshold)
  {
  final_result = paste(paste("Probability for insomnia:", Insomnia_Probabiliy, sep = " "), ". Patient is classified as having a sleep disorder.", sep = "")
  } else
  {
  final_result = paste(paste("Probability for insomnia:", Insomnia_Probabiliy, sep = " "), ". Patient is classified as not having a sleep disorder.", sep = "")  
  }

print(final_result)
#########################################################################################

