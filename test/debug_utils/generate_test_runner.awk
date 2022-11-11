/^void test/ {
	declarations[d++]=$$0;
	gsub(/\(?void\)? ?/,"");
	tests[t++]=$$0;
	line[u++]=NR
}

END {

	
	print "#include \"unity.h\" /* Autogenerated by awk in Makefile */" ;
	print "#include <stdio.h>";
	print "";

	for (i=0; i<d; i++) {
		print declarations[i] ";"
	}
	print "";

	
	print "int main(void)\n{" ;
	print "    setvbuf(stdout, NULL, _IONBF, 0);";
	print "    UnityBegin(\"" FILENAME "\");" ;
	print "";
	
	for (i=0; i<t; i++) {
		print "    RUN_TEST(" tests[i] ", " line[i] ");"
	}

	print "    return UNITY_END();\n}"
	print "";
}
