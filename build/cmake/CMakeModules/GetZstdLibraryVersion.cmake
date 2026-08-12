function(GetZstdLibraryVersion _header _major _minor _patch)
    # CMake's regex engine does not consistently let `.` span lines. Extract
    # each declaration independently so this works on all supported runners.
    file(STRINGS ${_header} VERSION_LINES REGEX "^#define ZSTD_VERSION_(MAJOR|MINOR|RELEASE) +[0-9]+")
    string(REGEX MATCH "ZSTD_VERSION_MAJOR +([0-9]+)" _major_match "${VERSION_LINES}")
    set(${_major} ${CMAKE_MATCH_1} PARENT_SCOPE)
    string(REGEX MATCH "ZSTD_VERSION_MINOR +([0-9]+)" _minor_match "${VERSION_LINES}")
    set(${_minor} ${CMAKE_MATCH_1} PARENT_SCOPE)
    string(REGEX MATCH "ZSTD_VERSION_RELEASE +([0-9]+)" _patch_match "${VERSION_LINES}")
    set(${_patch} ${CMAKE_MATCH_1} PARENT_SCOPE)
endfunction()
