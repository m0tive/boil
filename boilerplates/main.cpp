// File Info {{{
//------------------------------------------------------------------------------
/// \file @FILENAME@.cpp
/// \date @DATE@
/// \author @AUTHOR@
/// \brief
/// \note Copyright (C) @YEAR@ - All Rights Reserved
//}}}---------------------------------------------------------------------------

#ifdef WIN32
    #define WIN32_LEAN_AND_MEAN
    #include <Windows.h>
#endif

#ifdef USE_VLD // visual leak detector - catch memory leaks
    #include <vld.h>
#endif

#include <cstdlib>

int main(int argc, char** argv)
{
    return EXIT_SUCCESS;
}

