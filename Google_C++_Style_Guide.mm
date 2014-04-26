<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node ID="ID_1573781447" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml" MODIFIED="1350935459053">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Google C++ Style Guide
    </p>
  </body>
</html></richcontent>
<node FOLDED="true" ID="ID_63578286" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Header_Files" POSITION="right" TEXT="Header Files">
<node FOLDED="true" ID="ID_1171510279" TEXT="Comments">
<node ID="ID_895311965" MODIFIED="1350937854093">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      In general, every <font face="Courier New" color="#006600">.cc</font>&#xa0;file should have an associated <font face="Courier New" color="#006600">.h</font>&#xa0; file.&#xa0;
    </p>
  </body>
</html></richcontent>
<node ID="ID_558562309" MODIFIED="1350934888137">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      There are some common exceptions, such as unittests and small <font face="Courier New" color="#006600">.cc</font>&#xa0; files containing just a <font face="Courier New" color="#006600">main()</font>&#xa0;function.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_1229412703" TEXT="Correct use of header files can make a huge difference to the readability, size and performance of your code."/>
</node>
<node FOLDED="true" ID="ID_1319066539" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=The__define_Guard#The__define_Guard" TEXT="The #define Guard">
<node ID="ID_1000274200" MODIFIED="1350934519732">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      All header files should have <font face="Courier New" color="#006600">#define</font>&#xa0;guards to prevent multiple inclusion.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_841289387" MODIFIED="1350934590706">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      The format of the symbol name should be<font color="#006600"><i>&#xa0;</i></font><i><font color="#006600" face="Courier New">&lt;PROJECT&gt;_&lt;PATH&gt;_&lt;FILE&gt;</font></i><font color="#006600" face="Courier New">_H_</font>.
    </p>
  </body>
</html></richcontent>
</node>
<node FOLDED="true" ID="ID_1326265508" TEXT="To guarantee uniqueness, they should be based on the full path in a project&apos;s source tree.">
<node ID="ID_526600597" MODIFIED="1350934785262">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#xa0;For example, the file<font face="Courier New" color="#006600">&#xa0;foo/src/bar/baz.h</font>&#xa0;in project <font face="Courier New" color="#006600">foo</font>&#xa0; should have the following guard:
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_384300543" MODIFIED="1350934917663">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier New" color="#006600">#ifndef FOO_BAR_BAZ_H_ </font>
    </p>
    <p>
      <font face="Courier New" color="#006600">#define FOO_BAR_BAZ_H_ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New" color="#006600">... </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New" color="#006600">#endif // FOO_BAR_BAZ_H_ </font>
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1626137840" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Header_File_Dependencies#Header_File_Dependencies" TEXT="Header File Dependencies">
<node ID="ID_1911879571" MODIFIED="1350934995834">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Don't use an <font face="Courier New" color="#006600">#include</font>&#xa0;when a forward declaration would suffice.
    </p>
  </body>
</html></richcontent>
</node>
<node FOLDED="true" ID="ID_1694540494" TEXT="Details">
<node ID="ID_538440527" TEXT=""/>
</node>
<node FOLDED="true" ID="ID_138618956" TEXT="Note">
<node ID="ID_613271900" MODIFIED="1350935179223">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      If you use a symbol <font face="Courier New" color="#006600">Foo</font>&#xa0;in your source file, you should bring in a definition for <font face="Courier New" color="#006600">Foo</font>&#xa0;yourself, either via an <font face="Courier New">#include</font>&#xa0;or via a forward declaration.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1978587557" TEXT="Do not depend on the symbol being brought in transitively via headers not directly included."/>
<node ID="ID_872737592" MODIFIED="1350935284778">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      One exception is if <font face="Courier New" color="#006600">Foo</font>&#xa0;is used in <font face="Courier New" color="#006600">myfile.cc</font>, it's ok to #include (or forward-declare) <font face="Courier New" color="#006600">Foo</font>&#xa0;in <font face="Courier New" color="#006600">myfile.h</font>, instead of <font face="Courier New" color="#006600">myfile.cc</font>.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node ID="ID_108413006" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Inline_Functions#Inline_Functions" TEXT="Inline Functions"/>
<node ID="ID_1101631306" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=The_-inl.h_Files#The_-inl.h_Files" TEXT="The -inl.h Files"/>
<node ID="ID_378996030" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Function_Parameter_Ordering#Function_Parameter_Ordering" TEXT="Function Parameter Ordering"/>
<node ID="ID_812230746" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Names_and_Order_of_Includes#Names_and_Order_of_Includes" TEXT="Names and Order of Includes"/>
</node>
<node FOLDED="true" ID="ID_162217489" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Scoping" POSITION="right" TEXT="Scoping">
<node ID="ID_847237290" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Namespaces#Namespaces" TEXT="Namespaces"/>
<node ID="ID_11234758" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Nested_Classes#Nested_Classes" TEXT="Nested Classes"/>
<node ID="ID_1711292389" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Nonmember,_Static_Member,_and_Global_Functions#Nonmember,_Static_Member,_and_Global_Functions" TEXT="Nonmember, Static Member, Global Functions"/>
<node ID="ID_1820561360" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Local_Variables#Local_Variables" TEXT="Local Variables"/>
<node ID="ID_415258876" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Static_and_Global_Variables#Static_and_Global_Variables" TEXT="Static and Global Variables"/>
</node>
<node FOLDED="true" ID="ID_1688048357" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Classes" POSITION="right" TEXT="Classes">
<node ID="ID_143043770" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Doing_Work_in_Constructors#Doing_Work_in_Constructors" TEXT="Doing Work in Constructors"/>
<node ID="ID_561478011" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Default_Constructors#Default_Constructors" TEXT="Default Constructors"/>
<node ID="ID_927413954" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Explicit_Constructors" TEXT="Explicit Constructors"/>
<node ID="ID_628836384" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Copy_Constructors#Copy_Constructors" TEXT="Copy Constructors"/>
<node ID="ID_152600961" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Structs_vs._Classes#Structs_vs._Classes" TEXT="Structs vs. Classes"/>
<node ID="ID_764549782" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Inheritance#Inheritance" TEXT="Inheritance"/>
<node ID="ID_1660362480" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Multiple_Inheritance#Multiple_Inheritance" TEXT="Multiple Inheritance"/>
<node ID="ID_1100600356" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Interfaces#Interfaces" TEXT="Interfaces"/>
<node ID="ID_1057694644" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Operator_Overloading#Operator_Overloading" TEXT="Operator Overloading"/>
<node ID="ID_197015867" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Access_Control#Access_Control" TEXT="Access Control"/>
<node ID="ID_861950407" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Declaration_Order#Declaration_Order" TEXT="Declaration Order"/>
<node ID="ID_1206141032" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Write_Short_Functions#Write_Short_Functions" TEXT="Write Short Functions"/>
</node>
<node FOLDED="true" ID="ID_488158145" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Google-Specific_Magic" POSITION="right" TEXT="Google Specific Magic">
<node ID="ID_19664268" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Smart_Pointers#Smart_Pointers" TEXT="Smart Pointers"/>
<node ID="ID_1791646333" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=cpplint#cpplint" TEXT="cpplint"/>
</node>
<node FOLDED="true" ID="ID_81202880" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Other_C++_Features" POSITION="right" TEXT="Other C++ Features">
<node ID="ID_933487559" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Reference_Arguments#Reference_Arguments" TEXT="Reference Arguments"/>
<node ID="ID_1260923879" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Function_Overloading#Function_Overloading" TEXT="Function Overloading"/>
<node ID="ID_875755279" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Default_Arguments#Default_Arguments" TEXT="Default Arguments"/>
<node ID="ID_1519348822" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Variable-Length_Arrays_and_alloca__#Variable-Length_Arrays_and_alloca__" TEXT="Variable-Length Arrays and alloca()"/>
<node ID="ID_736151252" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Friends#Friends" TEXT="Friends"/>
<node ID="ID_50579506" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Exceptions#Exceptions" TEXT="Exceptions"/>
<node ID="ID_546990315" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Run-Time_Type_Information__RTTI_#Run-Time_Type_Information__RTTI_" TEXT="Run-Time Type Information (RTTI)"/>
<node ID="ID_1740177379" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Casting#Casting" TEXT="Casting"/>
<node ID="ID_466639326" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Streams#Streams" TEXT="Streams"/>
<node ID="ID_1380775199" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Preincrement_and_Predecrement#Preincrement_and_Predecrement" TEXT="Preincrement and Predecrement"/>
<node ID="ID_1407325749" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Use_of_const#Use_of_const" TEXT="Use of const"/>
<node ID="ID_1150415693" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Integer_Types#Integer_Types" TEXT="Integer Types"/>
<node ID="ID_1870310656" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=64-bit_Portability#64-bit_Portability" TEXT="64-bit Portability"/>
<node ID="ID_1873831458" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Preprocessor_Macros#Preprocessor_Macros" TEXT="Preprocessor Macros"/>
<node ID="ID_1228432980" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=0_and_NULL#0_and_NULL" TEXT="0 and NULL"/>
<node ID="ID_261938671" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=sizeof#sizeof" TEXT="sizeof"/>
<node ID="ID_1512823561" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Boost#Boost" TEXT="Boost"/>
<node ID="ID_522347462" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=C++11#C++11" TEXT="C++11"/>
</node>
<node FOLDED="true" ID="ID_1118560165" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Naming" POSITION="right" TEXT="Naming">
<node ID="ID_1938817679" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=General_Naming_Rules#General_Naming_Rules" TEXT="General Naming Rules"/>
<node ID="ID_1159247300" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=File_Names#File_Names" TEXT="File Names"/>
<node ID="ID_1852549112" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Type_Names#Type_Names" TEXT="Type Names"/>
<node ID="ID_528816977" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Variable_Names#Variable_Names" TEXT="Variable Names"/>
<node ID="ID_1841490594" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Constant_Names#Constant_Names" TEXT="Constant Names"/>
<node ID="ID_1220531602" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Function_Names#Function_Names" TEXT="Function Names"/>
<node ID="ID_890748754" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Namespace_Names#Namespace_Names" TEXT="Namespace Names"/>
<node ID="ID_50064176" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Enumerator_Names#Enumerator_Names" TEXT="Enumerator Names"/>
<node ID="ID_1651835706" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Macro_Names#Macro_Names" TEXT="Macro Names"/>
<node ID="ID_1603579477" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Exceptions_to_Naming_Rules#Exceptions_to_Naming_Rules" TEXT="Exceptions to Naming Rules"/>
</node>
<node FOLDED="true" ID="ID_1091959286" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Comments" POSITION="right" TEXT="Comments">
<node ID="ID_88104913" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Comment_Style#Comment_Style" TEXT="Comment Style"/>
<node ID="ID_932446609" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=File_Comments#File_Comments" TEXT="File Comments"/>
<node ID="ID_1276394933" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Class_Comments#Class_Comments" TEXT="Class Comments"/>
<node ID="ID_1011242409" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Function_Comments#Function_Comments" TEXT="Function Comments"/>
<node ID="ID_8361820" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Variable_Comments#Variable_Comments" TEXT="Variable Comments"/>
<node ID="ID_1678920783" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Implementation_Comments#Implementation_Comments" TEXT="Implementation Comments"/>
<node ID="ID_895260801" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Punctuation,_Spelling_and_Grammar#Punctuation,_Spelling_and_Grammar" TEXT="Punctuation, Spelling and Grammar"/>
<node ID="ID_773938567" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=TODO_Comments#TODO_Comments" TEXT="TODO Comments"/>
<node ID="ID_591714184" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Deprecation_Comments#Deprecation_Comments" TEXT="Deprecation Comments"/>
</node>
<node FOLDED="true" ID="ID_435661240" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Formatting" POSITION="right" TEXT="Formatting">
<node ID="ID_1158161587" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Line_Length#Line_Length" TEXT="Line Length"/>
<node ID="ID_1193428765" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Non-ASCII_Characters#Non-ASCII_Characters" TEXT="Non-ASCII Characters"/>
<node ID="ID_1995138244" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Spaces_vs._Tabs#Spaces_vs._Tabs" TEXT="Spaces vs. Tabs"/>
<node ID="ID_1491783921" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Function_Declarations_and_Definitions#Function_Declarations_and_Definitions" TEXT="Function Declarations and Definitions"/>
<node ID="ID_17187623" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Function_Calls#Function_Calls" TEXT="Function Calls"/>
<node ID="ID_843565901" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Conditionals#Conditionals" TEXT="Conditionals"/>
<node ID="ID_1620635497" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Loops_and_Switch_Statements#Loops_and_Switch_Statements" TEXT="Loops and Switch Statements"/>
<node ID="ID_1310704670" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Pointer_and_Reference_Expressions#Pointer_and_Reference_Expressions" TEXT="Pointer and Reference Expressions"/>
<node ID="ID_1230620869" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Boolean_Expressions#Boolean_Expressions" TEXT="Boolean Expressions"/>
<node ID="ID_971854682" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Return_Values#Return_Values" TEXT="Return Values"/>
<node ID="ID_1242944963" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Variable_and_Array_Initialization#Variable_and_Array_Initialization" TEXT="Variable and Array Initialization"/>
<node ID="ID_615445520" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Preprocessor_Directives#Preprocessor_Directives" TEXT="Preprocessor Directives"/>
<node ID="ID_1900336948" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Class_Format#Class_Format" TEXT="Class Format"/>
<node ID="ID_626423770" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Constructor_Initializer_Lists#Constructor_Initializer_Lists" TEXT="Constructor Initializer Lists"/>
<node ID="ID_1474088574" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Namespace_Formatting#Namespace_Formatting" TEXT="Namespace Formatting"/>
<node ID="ID_1763022136" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Horizontal_Whitespace#Horizontal_Whitespace" TEXT="Horizontal Whitespace"/>
<node ID="ID_30404928" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Vertical_Whitespace#Vertical_Whitespace" TEXT="Verticle Whitespace"/>
</node>
<node FOLDED="true" ID="ID_1645974849" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Explicit_Constructors#Exceptions_to_the_Rules" POSITION="right" TEXT="Exception to the Rules">
<node ID="ID_407313330" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Existing_Non-conformant_Code#Existing_Non-conformant_Code" TEXT="Existing Non-conformant Code"/>
<node ID="ID_1948393907" LINK="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?showone=Windows_Code#Windows_Code" TEXT="Windows Code"/>
</node>
<node FOLDED="true" ID="ID_1865062598" POSITION="left" TEXT="Version">
<node ID="ID_110839095" TEXT="Revision 3.199"/>
<node FOLDED="true" ID="ID_1287409513" TEXT="Authors">
<node ID="ID_1488801935" TEXT="Benjy Weinberger"/>
<node ID="ID_1964371857" TEXT="Craig Silverstein"/>
<node ID="ID_1224585659" TEXT="Gregory Eitzmann"/>
<node ID="ID_1619702887" TEXT="Mark Mentovai"/>
<node ID="ID_1179957296" TEXT="Tashana Landray"/>
</node>
</node>
</node>
</map>
