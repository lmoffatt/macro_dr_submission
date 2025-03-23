cmake_minimum_required(VERSION 3.5)

project(macro_dr LANGUAGES CXX)
find_package(OpenMP REQUIRED)

# git commit hash macro
execute_process(
  COMMAND git log -1 --format=%h
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE GIT_COMMIT_HASH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
add_definitions("-DGIT_COMMIT_HASH=\"${GIT_COMMIT_HASH}\"")



set(CMAKE_CXX_STANDARD 20)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_BUILD_TYPE "Release")

#set (CMAKE_CXX_FLAGS "-ftemplate-backtrace-limit=20 -Werror=return-type -fconcepts-diagnostics-depth=4 -fmax-errors=5 -ftime-report" )

set (CMAKE_CXX_FLAGS "-ftemplate-backtrace-limit=20 -Werror=return-type  -fmax-errors=5 -ftime-report" )
#set_property(TARGET macro_dr PROPERTY CXX_STANDARD 20)


#find_package(Catch2 REQUIRED)
#target_link_libraries(tests Catch2::Catch2)
#set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
#set(THREADS_PREFER_PTHREAD_FLAG TRUE)
#find_package(Threads REQUIRED)

find_package(BLAS )
find_package(LAPACK )
find_package(GSL )


if(LAPACK_FOUND AND BLAS_FOUND)
  set(lapackblas_libraries ${BLAS_LIBRARIES} ${LAPACK_LIBRARIES})
else()
    set(lapackblas_libraries /nfs/home/lmoffatt/.nix-profile/lib/libcblas.so /nfs/home/lmoffatt/.nix-profile/lib/liblapack.so)
endif()



if(GSL_FOUND)
  set(gsl_library ${GSL_LIBRARY})
else()
    set(gsl_library /nfs/home/lmoffatt/.nix-profile/lib/libgsl.so )
endif()

if(GSL_FOUND)
  set(gsl_dir ${GSL_INCLUDE_DIR})
else()
    set(gsl_dir /nix/store/snnl5y7hbk7b49cvfi8mhvgzrknjwz1p-gsl-2.7.1-dev/include/ )
endif()


#find_package(BLAS REQUIRED)
#find_package(LAPACK REQUIRED)


#if(LAPACK_FOUND AND BLAS_FOUND)
#  set(lapackblas_libraries ${BLAS_LIBRARIES} ${LAPACK_LIBRARIES})
#endif()


add_executable(macro_dr main.cpp
  experiments/Moffatt_Hume_2007_ATP_time_idealized_2.txt experiments/Moffatt_Hume_2007_ATP_time_recording.txt experiments/Moffatt_Hume_2007_ATP_time_segments.txt models/scheme_1.txt models/scheme_10.txt models/scheme_10_par.csv models/scheme_10_prior.csv models/scheme_11.txt models/scheme_11_par.csv models/scheme_11_prior.csv models/scheme_1_par.csv models/scheme_1_prior.csv models/scheme_2.txt models/scheme_2_par.csv models/scheme_2_prior.csv models/scheme_3.txt models/scheme_3_par.csv models/scheme_3_prior.csv models/scheme_4.txt models/scheme_4_par.csv models/scheme_4_prior.csv models/scheme_5.txt models/scheme_5_par.csv models/scheme_5_prior.csv models/scheme_6.txt models/scheme_6_par.csv models/scheme_6_prior.csv models/scheme_7.txt models/scheme_7_par.csv models/scheme_7_prior.csv models/scheme_8.txt models/scheme_8_par.csv models/scheme_8_prior.csv models/scheme_9.txt models/scheme_9_par.csv models/scheme_9_prior.csv scripts/beta_4.txt scripts/evidence_thermo_dts_continuation.txt scripts/evidence_thermo_dts_data.txt scripts/idealize_experiment_2.txt scripts/likelihood_DR.txt scripts/likelihood_SNR.txt scripts/run_Evidence.txt scripts/simulation.txt scripts/test_likelihood.txt slurm/M_scheme_N_tasks.sh slurm/multi_task_M_scheme_N_tasks.sh slurm/run_32_scheme_10_11_DR_continuation.sh slurm/run_32_scheme_10_11_SNR.sh slurm/run_32_scheme_10_DR.sh slurm/run_32_scheme_4_9_DR_continuation.sh slurm/run_32_scheme_4_9_SNR.sh slurm/run_32_scheme_4_DR.sh slurm/run_32_scheme_6_DR_SNR.sh slurm/run_32_scheme_7_DR_SNR.sh slurm/run_64_CPU_16_schemes_1_2_DR_SNR.sh slurm/run_64_CPU_16_schemes_3_5_DR_SNR.sh slurm/run_64_CPU_32_schemes_4_DR_SNR_continuation.sh slurm/run_64_CPU_32_schemes_8_DR_SNR_continuation.sh slurm/run_64_CPU_32_schemes_9_DR_SNR_continuation.sh slurm/set_default_variables.sh allosteric_models.h bayesian_linear_regression.h CLI_base.h CLI_function_table.h CLI_grammar.h CLI_likelihood.h CLI_macro_dr.h CLI_macro_dr_base.h CLI_regular_types.h CLI_thermo_evidence.h CLI_thermo_evidence_dts.h CLI_thermo_levenberg_evidence.h CMakeLists.txt continuation.h cuevi.h derivative_operator.h derivative_test.h distributions.h experiment.h exponential_matrix.h fold.h function_measure_verification_and_optimization.h function_memoization.h general_algorithm_on_containers.h general_output_operator.h grammar_Identifier.h grammar_typed.h grammar_untyped.h gsl_integrate.h indexed.h lapack_headers.h lexer_typed.h lexer_untyped.h lgamma.h LICENSE main.cpp matrix.h matrix_derivative.h matrix_random.h maybe_error.h mcmc.h micror_stochastic.h models_MoffattHume_allosteric.h models_MoffattHume_linear.h multivariate_normal_distribution.h parallel_levenberg_tempering.h parallel_tempering.h parallel_tempering_linear_regression.h parameters.h parameters_derivative.h parameters_distribution.h qmodel.h random_samplers.h README.md type_algebra.h variables.h variables_derivative.h
  scripts/calculate_likelihood.txt
)
include_directories( ${gsl_dir})

target_link_libraries(macro_dr ${lapackblas_libraries} ${gsl_library} OpenMP::OpenMP_CXX)

include(GNUInstallDirs)
install(TARGETS macro_dr
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
