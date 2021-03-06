# Run bzip2 test and compare output with expected output

message(STATUS "Running test ${BZIP2_COMMAND} ${BZIP2_ARG} < ${BZIP2_INPUT} > ${BZIP2_OUTPUT} (to be compared with ${BZIP2_EXPECTED_OUTPUT})")

# Run test command

execute_process(COMMAND "${BZIP2_COMMAND}" ${BZIP2_ARG}
                INPUT_FILE "${BZIP2_INPUT}"
                OUTPUT_FILE "${BZIP2_OUTPUT}"
                RESULT_VARIABLE BZIP2_STATUS)

if (BZIP2_STATUS)
  message(FATAL_ERROR "bzip2: Test run failed")
endif()

# Compare output

execute_process(COMMAND "${CMAKE_COMMAND}" -E compare_files
                "${BZIP2_OUTPUT}" "${BZIP2_EXPECTED_OUTPUT}"
                RESULT_VARIABLE BZIP2_COMPARE_STATUS)

if (BZIP2_COMPARE_STATUS)
  message(FATAL_ERROR "bzip2: Test output comparison failed")
endif()
