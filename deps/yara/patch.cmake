
function(patch_vcxproj file)

    file(READ "${file}" content)
    set(new_content "${content}")

    string(REPLACE
        "jansson.lib"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "libcrypto.lib"
        ""
        new_content
        "${new_content}"
    )
	# We also use this to enable macho module.
    string(REPLACE
        "CUCKOO_MODULE"
        "MACHO_MODULE"
        new_content
        "${new_content}"
    )
    string(REPLACE
        "HASH_MODULE"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "HAVE_LIBCRYPTO"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "PROFILING_ENABLED"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.Jansson.x64.1.1.0\\include"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.Jansson.x86.1.1.0\\include"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.Jansson.x64.1.1.0\\lib"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.Jansson.x86.1.1.0\\lib"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.OpenSSL.x64.1.1.0\\include"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.OpenSSL.x86.1.1.0\\include"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.OpenSSL.x64.1.1.0\\lib"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "..\\packages\\YARA.OpenSSL.x86.1.1.0\\lib"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
		"<ClCompile Include=\"..\\..\\..\\libyara\\modules\\cuckoo\\cuckoo.c\" />"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "<ClCompile Include=\"..\\..\\..\\libyara\\modules\\dex\\dex.c\" />"
        ""
        new_content
        "${new_content}"
    )
    string(REPLACE
        "<ClCompile Include=\"..\\..\\..\\libyara\\modules\\hash\\hash.c\" />"
        ""
        new_content
        "${new_content}"
    )

	if(RETDEC_MSVC_STATIC_RUNTIME)
		string(REPLACE
			"MultiThreadedDLL"
			"MultiThreaded"
			new_content
			"${new_content}"
		)
	endif()

    if("${new_content}" STREQUAL "${content}")
        message("-- Patching: ${file} skipped")
    else()
        message("-- Patching: ${file} patched")
        file(WRITE "${file}" "${new_content}")
    endif()
endfunction()

patch_vcxproj("${yara_path}/windows/vs2015/libyara/libyara.vcxproj")
patch_vcxproj("${yara_path}/windows/vs2015/libyara/libyara.vcxproj")
