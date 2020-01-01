include(vcpkg_common_functions)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO victor-smirnov/disruptor-memoria
  REF 18a4f543f3314ca58165e87fa7f61df350ba1039
  SHA512 0cc04c81cf23fe23910dcc6904e38ecb9c38100bd20760bb44b67a37f434014074d8f4eb78be734e27c33d8ac0e52322cf404748c97971f0d99b2e58f789c44d
  HEAD_REF develop
)


vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/disruptor-memoria RENAME copyright)


# Handle includes separately
file(COPY ${SOURCE_PATH}/disruptor/claim_strategy.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/event_processor.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/ring_buffer.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/sequence.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/sequence_barrier.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/sequencer.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/utils.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
file(COPY ${SOURCE_PATH}/disruptor/wait_strategy.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/disruptor-memoria)
