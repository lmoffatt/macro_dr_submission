#!/bin/bash


case $SLURM_LOCALID in
0)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_4_inact.txt ../macro_dr/scripts/idealize_idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_4_inact_0\""  "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

1)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_6_inact.txt ../macro_dr/scripts/idealize_idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_6_inact_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt  ../macro_dr/scripts/evidence_thermo_data.txt
;;

2)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_7_inact.txt ../macro_dr/scripts/idealize_idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_7_inact_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

3)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_8_inact.txt ../macro_dr/scripts/idealize_idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_8_inact_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

4)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_9_inact.txt ../macro_dr/scripts/idealize_idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_9_NP_inact_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

5)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_4_inact_PI.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_4_inact_PI_0\""  "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

6)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_6_inact_PI.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_6_inact_PI_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt  ../macro_dr/scripts/evidence_thermo_data.txt
;;

7)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_7_inact_PI.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_7_inact_PI_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

8)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_8_inact_PI.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_8_inact_PI_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

9)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_9_inact_PI.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_9_inact_PI_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;


10)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_4_inact_NP.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_4_inact_NP_0\""  "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

11)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_6_inact_NP.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_6_inact_NP_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt  ../macro_dr/scripts/evidence_thermo_data.txt
;;

12)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_7_inact_NP.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_7_inact_NP_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

13)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_8_inact_NP.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_8_inact_NP_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

14)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_9_inact_NP.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_9_inact_NP_0\"" "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

15)
$PATH_MACRO_DR/macro_dr ../macro_dr/models/scheme_4_inact.txt ../macro_dr/scripts/idealize_experiment.txt  ../macro_dr/scripts/simulation.txt "--runIdName= \"v20_IE_scheme_4_inact2_0\""  "--num_scouts_per_ensemble = get_number(n=32)" ../macro_dr/scripts/likelihood.txt ../macro_dr/scripts/evidence_thermo_data.txt
;;

esac

