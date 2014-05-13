<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node ID="ID_568055310" TEXT="RAFT">
<node FOLDED="true" ID="ID_1684504576" POSITION="right" TEXT="Papers">
<node FOLDED="true" ID="ID_781633082" LINK="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;cad=rja&amp;uact=8&amp;ved=0CCgQFjAA&amp;url=https%3A%2F%2Framcloud.stanford.edu%2F~ongaro%2Fraftproof.pdf&amp;ei=ITpdU4bhBan4yAHrjYD4Bg&amp;usg=AFQjCNFjCLDGUGTFTRIyJiQvl0rNE6v0lA&amp;bvm=bv.65397613,d.aWc" TEXT="Safety Proof and Formal Specification for Raft">
<node FOLDED="true" ID="ID_1933790261" TEXT="Header">
<node ID="ID_329601601" TEXT="Stanford University">
<node ID="ID_1468578758" TEXT="Diego Ongaro"/>
<node ID="ID_242568760" TEXT="John Ousterhout"/>
</node>
<node ID="ID_775730372" TEXT="last updated March 28, 2013"/>
</node>
<node FOLDED="true" ID="ID_1959328104" TEXT="1 Introduction">
<node ID="ID_1992326231" TEXT="This document is a proof of safety for the Raft replication algorithm. "/>
<node ID="ID_1866736927" TEXT="Liveness is not addressed, ">
<node ID="ID_417802663" TEXT="nor is reconfiguration."/>
</node>
</node>
<node FOLDED="true" ID="ID_1270886712" TEXT="2 System Model">
<node ID="ID_1138345553" TEXT="This document uses the usual asynchronous system assumptions."/>
<node ID="ID_1404827083" TEXT="Assumptions">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node ID="ID_378757005" TEXT="&#x2022;">
<node ID="ID_804799290" TEXT="Messages may take an arbitrary number of steps to arrive at a server;"/>
<node ID="ID_1615723357" TEXT="once they arrive, they are modeled as being processed in one atomic step."/>
</node>
<node ID="ID_804268215" TEXT="&#x2022;">
<node ID="ID_650498610" TEXT="Servers fail by stopping and may later restart from stable storage on disk."/>
</node>
<node ID="ID_832293060" TEXT="&#x2022;">
<node ID="ID_1744645320" TEXT="The network may reorder, drop, and duplicate messages. "/>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1646468231" TEXT="3 Conventions">
<node ID="ID_1776702586" LINK="http://research.microsoft.com/en-us/um/people/lamport/tla/tla.html" TEXT="The specification uses the syntax and semantics of the TLA+ language version 2."/>
<node ID="ID_325748792" TEXT="The remainder of this document uses the same syntax and semantics but with the following minor allowances for convenience. "/>
<node ID="ID_359268103" TEXT="TLA+ allowances">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node ID="ID_1874291901" TEXT="&#x2022;">
<node ID="ID_743602695">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      As in TLA+, <i>foo&#8242;</i>&#160;has a specific meaning:
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_573434809">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      the value of variable <i>foo</i>&#160;in the next state of the system.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_435786138" TEXT="&#x2022;">
<node ID="ID_1087028449" TEXT="We say">
<node ID="ID_1274040364">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      <i>&#10216;index,term&#10217; &#8712; log</i>&#160;iff
    </p>
  </body>
</html></richcontent>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node ID="ID_1163001806">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      <i>Len(log) &#8805; index &#8743; log[index].term</i>&#160;= <i>term</i>.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node ID="ID_1542263086" TEXT="&#x2022;">
<node ID="ID_15774088" TEXT="We use the symbol &#x2016; for concatenation of logs and entries."/>
</node>
<node ID="ID_1150109605" TEXT="&#x2022;">
<node ID="ID_1481726398" TEXT="We ignore values in log entries, ">
<node ID="ID_1209816549">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      since it&#8217;s easy to see that a value is attached to a particular <i>&#10216;index,term&#10217;</i>,&#160;
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_583272577" TEXT="and those uniquely identify a log entry"/>
</node>
</node>
</node>
</node>
<node ID="ID_695620575" TEXT="4 Specifications">
<node ID="ID_941062827" TEXT="This section provides a complete, formal description of the Raft algorithm."/>
<node ID="ID_1291776836" TEXT="MODULE raft">
<font NAME="Courier" SIZE="12"/>
<node FOLDED="true" ID="ID_1555839902">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Constants
    </p>
  </body>
</html></richcontent>
<node ID="ID_1936397143" TEXT="This is the formal specification for the Raft replication algorithm."/>
<node ID="ID_1695335218" TEXT="EXTENDS ">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1679570741" TEXT="Naturals, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1274059179" TEXT="FiniteSets, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_838091011" TEXT="Sequences, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_859782753" TEXT="TLC, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1256286338" TEXT="TLAPS">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_715987515" TEXT="">
<node ID="ID_995747284">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The set of server <i>IDs</i>
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_414577860">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      CONSTANTS Replica
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_290888677" TEXT="">
<node ID="ID_715166079">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The set of requests that can go into the <i>log</i>
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1664927846" TEXT="CONSTANTS Value">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1394460520" TEXT="">
<node ID="ID_144113695" TEXT="Server states."/>
<node ID="ID_1627891062" TEXT="CONSTANTS ">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_243418431" TEXT="Follower, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_614687312" TEXT="Candidate, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1740351829" TEXT="Leader">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node ID="ID_339753994" TEXT="">
<node ID="ID_938899215" TEXT="A reserved value."/>
<node ID="ID_987321722" TEXT="CONSTANTS Nil">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1389537523" TEXT="">
<node ID="ID_828914608" TEXT="Message types"/>
<node ID="ID_426325608" TEXT="CONSTANTS ">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_411677720" TEXT="RequestVoteRequest, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_874818930" TEXT="RequestVoteResponse, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1458205042" TEXT="AppendEntriesRequest, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_714150780" TEXT="AppendEntriesResponse">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node ID="ID_1950612481" TEXT="">
<node ID="ID_1550755940" TEXT="">
<node ID="ID_1818442479" TEXT="A bag of records representing requests and responses set from one server to another."/>
<node ID="ID_44762279">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      <i>TLAPS</i>&#160;doesn&#8217;t support the Bags module, so this is a function mapping Message to <i>PNat</i>.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_1390650734" TEXT="VARIABLE messages">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_864388888" TEXT="">
<node ID="ID_86876117" TEXT="">
<node ID="ID_93875169" TEXT="A history variable used in the proof. "/>
<node ID="ID_903558885" TEXT="This would not be present in an implementation."/>
<node ID="ID_1858984478" TEXT="Keeps track of successful elections, including the initial logs of the leader and voters&#x2019; logs."/>
</node>
<node ID="ID_1223788918" TEXT="VARIABLE elections">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1175906801" TEXT="">
<node ID="ID_199686401" TEXT="">
<node ID="ID_90422106" TEXT="A history variable used in the proof. "/>
<node ID="ID_951053640" TEXT="This would not be present in an implementation. "/>
<node ID="ID_1856462385">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      Keeps track of every <i>log</i>&#160;ever in the system.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_82325715" TEXT="VARIABLE allLogs">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1466685386" TEXT="Server Variables">
<font NAME="SansSerif" SIZE="12"/>
<node ID="ID_1196242869">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The following variables are all per server (functions with the domain <i>Replica</i>).
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1487293953" TEXT="">
<node ID="ID_1998036868" TEXT=" The server&#x2019;s term number."/>
<node ID="ID_999363286" TEXT="VARIABLE currentTerm">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1546493014" TEXT="">
<node ID="ID_892928549">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The server&#8217;s state (<font face="Courier">Follower</font>, <font face="Courier">Candidate</font>, or <font face="Courier">Leader</font>).
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_117417457" TEXT="VARIABLE state">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1012763547" TEXT="">
<node ID="ID_1617530160">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The candidate the server voted for in its current term, or <font face="Courier">Nil</font>&#160;if it hasn&#8217;t voted for any.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_459428964" TEXT="VARIABLE votedFor">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1551861464">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      replicaVars &#8796; &#10216;currentTerm ,state ,votedFor&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1722821115" TEXT="">
<node ID="ID_1722421650" TEXT="">
<node ID="ID_1528608610">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      A Sequence of <i>log</i>&#160;entries.&#160;
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_498811289">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The index into this sequence is the index of the <i>log</i>&#160;entry.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1260522792" TEXT="Unfortunately, the Sequence module defines Head(s) as the entry with index 1, so be careful not to use that!"/>
</node>
<node ID="ID_1680203359" TEXT="VARIABLE log">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_974697854" TEXT="">
<node ID="ID_351379470">
<richcontent TYPE="NODE"><html>
  <head>

  </head>
  <body>
    <p>
      The latest entry the state machine may apply is <font face="Courier">commitIndex</font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_15812988" TEXT="VARIABLE commitIndex">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_418888682" TEXT="logVars &#x225c; &#x27e8;log , commitIndex&#x27e9;">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_197256667" TEXT="">
<node ID="ID_574637499" TEXT="">
<node ID="ID_1798514864" TEXT="The following variables are used only on candidates:"/>
<node ID="ID_1941493083">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      The set of servers from which the candidate has received a <font face="Courier">RequestVote</font>&#160; response in this term.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_766885425" TEXT="VARIABLE votesResponded">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_194828601" TEXT="">
<node ID="ID_994788689" TEXT="The set of servers from which the candidate has received a vote in this term"/>
<node ID="ID_111870063" TEXT="VARIABLE votesGranted">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_881163362" TEXT="">
<node ID="ID_225066557" TEXT="">
<node ID="ID_335428298" TEXT="A history variable used in the proof."/>
<node ID="ID_1072352205" TEXT="This would not be present in an implementation."/>
<node ID="ID_893418833" TEXT="Keeps track of the log of each voter."/>
</node>
<node ID="ID_202603231" TEXT="VARIABLE voterLog">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1302180289" TEXT="candidateVars &#x225c; &#x27e8;votesResponded , votesGranted , voterLog&#x27e9;">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_845101004" TEXT="">
<node ID="ID_11324526" TEXT="">
<node ID="ID_1200067685" TEXT="The following variables are used only on leaders:"/>
<node ID="ID_28683258" TEXT="The next entry to send to each follower."/>
</node>
<node ID="ID_1810028743" TEXT="VARIABLE nextIndex">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_748484962" TEXT="">
<node ID="ID_1011601093" TEXT="">
<node ID="ID_32185832" TEXT="The last entry that each follower has acknowledged is the same as the leader&apos;s."/>
<node ID="ID_9221099">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      This is used to calculate <font face="Courier">commitIndex</font>&#160;on the leader.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_1796177112" TEXT="variable lastAgreeIndex">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_69739715" TEXT="leaderVars &#x225c; &#x27e8;nextIndex , lastAgreeIndex , elections&#x27e9;">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1283809929" TEXT="End of per server variables."/>
</node>
<node FOLDED="true" ID="ID_276058198" TEXT="Stuttering Variables">
<node ID="ID_864694076" TEXT="All variables; used for stuttering."/>
<node ID="ID_98663363" TEXT="vars &#x225c; ">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1452371958" TEXT="&#x27e8;">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1880408338" TEXT="messages, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1036184648" TEXT="replicaVars, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1555984228" TEXT="candidateVars, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1670706478" TEXT="leaderVars, ">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1749087849" TEXT="logVars">
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1330536503" TEXT="&#x27e9;">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_267384115" TEXT="Helpers">
<node ID="ID_1719994503" TEXT="Helpers"/>
<node ID="ID_580423849" TEXT="">
<node ID="ID_1990208887" TEXT="">
<node ID="ID_1389739841" TEXT="The set of all quorums. "/>
<node ID="ID_1097167050" TEXT="This just calculates simple majorities, "/>
<node ID="ID_1783440459" TEXT="but the only important property is that every quorum overlaps with every other"/>
</node>
<node ID="ID_639015752">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Quorum</i>&#160;&#8796; {<i>i</i>&#160;&#8712; SUBSET(<i>Replica</i>) : <i>Cardinality</i>(<i>i</i>) &#8727; 2 &gt; <i>Cardinality</i>(<i>Replica</i>)}
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1708725376" TEXT="">
<node ID="ID_712254348">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      The term of the last entry in a <i>log</i>, or 0 if the <i>log</i>&#160;is empty.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_138467341">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>LastTerm</i>(<i>xlog</i>) &#8796; IF <i>Len</i>(<i>xlog</i>) = 0 THEN 0 ELSE <i>xlog</i>[<i>Len</i>(<i>xlog</i>)].<i>term</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_75516182" TEXT="">
<node ID="ID_1558952678" TEXT="Helper for Send and Reply"/>
<node ID="ID_453005108">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>WithMessage</i>(<i>m</i>, <i>msgs</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1207630741" TEXT="&#x225c;">
<node ID="ID_1034299738">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      IF <i>m</i>&#160;&#8712; DOMAIN <i>msgs</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1374621354">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      THEN [<i>msgs</i>&#160;EXCEPT ![<i>m</i>] = <i>msgs</i>[<i>m</i>] + 1]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_424063138" TEXT="ELSE">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1513336428">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>msgs</i>&#160;@@ (<i>m</i>&#160;:&gt; 1)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node ID="ID_250998468" TEXT="">
<node ID="ID_1844441486" TEXT="Helper for Discard and Reply"/>
<node ID="ID_1529886921">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>WithoutMessage</i>(<i>m</i>, <i>msgs</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_386929609" TEXT="&#x225c;">
<node ID="ID_336268888">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      IF <i>m</i>&#160;&#8712; DOMAIN <i>msgs</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1530567893">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      THEN [<i>msgs</i>&#160;EXCEPT ![<i>m</i>] = <i>msgs</i>[<i>m</i>] - 1]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_659371273" TEXT="ELSE">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_392840185">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>msgs</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node ID="ID_832931530" TEXT="">
<node ID="ID_1833425557" TEXT="Add a message to the set of messages."/>
<node ID="ID_1987848093">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Send</i>(<i>m</i>) &#8796; <i>messages&#8242;</i>&#160;= <i>WithMessage</i>(<i>m</i>, <i>messages</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1109952004" TEXT="">
<node ID="ID_417595322" TEXT="The recipient is done processing the message."/>
<node ID="ID_1291868325">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Discard</i>(<i>m</i>) &#8796; <i>messages&#8242;</i>&#160;= <i>WithoutMessage</i>(<i>m</i>, <i>messages</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_301000080" TEXT="">
<node ID="ID_1562703791" TEXT="Combination of Send and Discard"/>
<node ID="ID_911828523">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Reply</i>(<i>response</i>, <i>request</i>) &#8796; <i>messages&#8242;</i>&#160;= <i>WithoutMessage</i>(<i>request</i>, <i>WithMessage</i>(<i>response</i>, <i>messages</i>))
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_273294785" TEXT="">
<node ID="ID_1756481562" TEXT="Return the minimum value from a set, or undefined if the set is empty."/>
<node ID="ID_249270596">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Min</i>(<i>s</i>) &#8796; CHOOSE <i>x</i>&#160;&#8712; <i>s</i>&#160;: &#8704; <i>y</i>&#160; &#8712; <i>s</i>&#160;: <i>x</i>&#160;&#8804; <i>y</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1018905965" TEXT="">
<node ID="ID_554179374" TEXT="Return the maximum value from a set, or undefined if the set is empty."/>
<node ID="ID_693425094">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Max</i>(<i>s</i>) &#8796; CHOOSE <i>x</i>&#160;&#8712; <i>s</i>&#160;: &#8704; <i>y</i>&#160; &#8712; <i>s</i>&#160;: <i>x</i>&#160;&#8805; <i>y</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1265905330" TEXT="Leadership">
<icon BUILTIN="button_cancel"/>
<node ID="ID_418098305" TEXT="">
<node ID="ID_1857803305" TEXT="Define initial values for all variables"/>
<node ID="ID_261225088" TEXT="InitHistoryVars ">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_60351973" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_44104924">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>elections</i>&#160;= {}
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_510174538">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>allLogs</i>&#160;= {}
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_753610661">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>voterLog</i>&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; [<i>j</i>&#160; &#8712; {} &#8614; &#10216;&#10217;]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<icon BUILTIN="button_cancel"/>
</node>
</node>
</node>
<node ID="ID_537061174" TEXT="InitReplicaVars">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_673684110" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_122251362">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>currentTerm</i>&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; 1]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_756304335">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>state</i>&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; <i>Follower</i>]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1417068779">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>votedFor</i>&#160;&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; <i>Nil</i>]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node ID="ID_972534036" TEXT="InitCandidateVars">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_483324404" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1346520531">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; votesResponded&#160;&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; {}]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1862723200">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; votesGranted&#160;&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; {}]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_137196370" TEXT="">
<node ID="ID_582777672" TEXT="">
<node ID="ID_343337152">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      The values <font face="Courier"><i>nextIndex</i>[<i>i</i>][<i>i</i>]</font>&#160;and <font face="Courier"><i>lastAgreeIndex</i>[<i>i</i>][<i>i</i>]</font>&#160; are never read, since the leader does not send itself messages.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_771895971" TEXT="It&apos;s still easier to include these in the functions."/>
</node>
<node ID="ID_1685809371" TEXT="InitLeaderVars">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_572464335" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1042667973">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>nextIndex</i>&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; [<i>j</i>&#160; &#8712; <i>Replica</i>&#160;&#8614; 1]]
    </p>
    <p>
      &#8743; <i>lastAgreeIndex</i>&#160;= [<i>i</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; [<i>j</i>&#160; &#8712; <i>Replica</i>&#160;&#8614; 0]]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node ID="ID_1262831120" TEXT="InitLogVars">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1904405486" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1209480912">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="CMSY10" size="3">&#8743;</font><font size="3">&#160;<i>log</i>&#160;= [<i>i</i>&#160;</font><font face="CMSY10" size="10.000000pt">&#8712;</font><font size="3">&#160; <i>Replica</i>&#160;</font><font face="CMTI10" size="10.000000pt">&#8614;</font><font size="3">&#160;&#10216;&#10217;] </font>
    </p>
    <div title="Page 4" class="page">
      <div class="layoutArea">
        <div class="column">
          <p>
            <font size="3" face="CMSY10">&#8743; </font><font size="3" face="CMTI10"><i>commitIndex</i>&#160;</font><font size="3" face="CMR10">= [</font><font size="3" face="CMTI10"><i>i</i>&#160; </font><font size="3" face="CMSY10">&#8712; </font><font size="3" face="CMTI10"><i>Replica</i>&#160;&#8614;</font><font size="3" face="CMSY10">&#160;</font><font size="3" face="CMR10">0] </font>
          </p>
        </div>
      </div>
    </div>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node ID="ID_331639029" TEXT="Init">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_509751263" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1676797775">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <div title="Page 4" class="page">
      <div class="layoutArea">
        <div class="column">
          <p>
            <font size="3" face="Courier">&#8743; <i>messages</i>&#160;= [<i>m</i>&#160;&#8712; {} &#8614; 0] </font>
          </p>
          <p>
            <font size="3" face="Courier">&#8743; <i>InitHistoryVars</i><br size="3" face="Courier" />&#8743; <i>InitReplicaVars</i><br size="3" face="Courier" />&#8743; <i>InitCandidateVars</i>&#160;</font>
          </p>
          <p>
            <font size="3" face="Courier">&#8743; <i>InitLeaderVars</i>&#160; </font>
          </p>
          <p>
            <font size="3" face="Courier">&#8743; <i>InitLogVars</i>&#160;</font>
          </p>
        </div>
      </div>
    </div>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_1237575554" TEXT="">
<node ID="ID_1827621250" TEXT="The network duplicates a message"/>
<node ID="ID_896948087" TEXT="DuplicateMessage">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1428491999" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1286992234">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; &#8707; <i>m</i>&#160;&#8712; DOMAIN&#160;<i>messages</i>&#160;:
    </p>
    <p>
      &#160; <i>Send</i>(<i>m</i>)&#160;&#160;
    </p>
    <p>
      &#8743; UNCHANGED&#160;&#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;&#160;&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_1645758873" TEXT="">
<node ID="ID_1898206160" TEXT="The network drops a message"/>
<node ID="ID_273382268" TEXT="DropMessage">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_949169559" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1734743372">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; &#8707; <i>m</i>&#160;&#8712; DOMAIN (<i>messages</i>):
    </p>
    <p>
      &#160; <i>Discard</i>(<i>m</i>)
    </p>
    <p>
      &#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_184970449" TEXT="">
<node ID="ID_1677884991" TEXT="Server i times out and starts a new election."/>
<node ID="ID_1401660558" TEXT="Timeout(i)">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_255388866" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1204550978">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>state</i>[<i>i</i>] &#8712; {<i>Follower</i>, <i>Candidate</i>}
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_636486282">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>state&#8242;</i>&#160;= [<i>state</i>&#160;EXCEPT ![<i>i</i>] = <i>Candidate</i>]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1772295825">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>currentTerm&#8242;</i>&#160;= [<i>currentTerm</i>&#160;EXCEPT ![<i>i</i>] = <i>currentTerm</i>[<i>i</i>] + 1]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1452469600" TEXT="Most implementations would probably just set the local vote atomically, but messaging localhost for it is weaker."/>
<node ID="ID_819434562">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>votedFor&#8242;</i>&#160;= [<i>votedFor</i>&#160;EXCEPT ![<i>i</i>] = <i>Nil</i>]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1267568435">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>votesResponded&#8242;</i>&#160;= [<i>votesResponded</i>&#160;EXCEPT ![<i>i</i>] = {}]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_129040831">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>votesGranted&#8242;</i>&#160;=[<i>votesGranted</i>&#160;EXCEPT ![<i>i</i>] = {}]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1564442168">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>voterLog&#8242;</i>&#160;= [<i>voterLog</i>&#160;EXCEPT ![<i>i</i>] = [<i>j</i>&#160;&#8712; {} &#8614; &#10216;&#10217;]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1895444971">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; UNCHANGED &#10216;<i>messages</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_24271704" TEXT="">
<node ID="ID_1904267806" TEXT="">
<node ID="ID_541137222">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Server <font face="Courier"><i>i</i></font>&#160;restarts from stable storage.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1781154067">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      It loses everything, but its <font face="Courier"><i>currentTerm</i></font>, <font face="Courier"><i>votedFor</i></font>&#160; and <font face="Courier"><i>log</i></font>.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_1016761249">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Restart</i>(<i>i</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_474220436" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1409477250">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; UNCHANGED &#10216;<i>messages</i>, <i>currentTerm</i>, <i>votedFor</i>, <i>log</i>, <i>elections</i>&#10217;
    </p>
    <p>
      &#8743; <i>state&#8242;</i>&#160;= [<i>state</i>&#160;EXCEPT ![<i>i</i>] = <i>Follower</i>]
    </p>
    <p>
      &#8743; <i>votesResponded&#8242;</i>&#160;= [<i>votesResponded</i>&#160;EXCEPT ![<i>i</i>] = {}]
    </p>
    <p>
      &#8743; <i>votesGranted&#8242;</i>&#160;= [<i>votesGranted</i>&#160;EXCEPT ![<i>i</i>] = {}]
    </p>
    <p>
      &#8743; <i>voterLog&#8242;</i>&#160;= [<i>voterLog</i>&#160;EXCEPT ![<i>i</i>] = [j &#8712; {} &#8614; &#10216;&#10217;]
    </p>
    <p>
      &#8743; <i>nextIndex&#8242;</i>&#160;= [<i>nextIndex</i>&#160;EXCEPT ![<i>i</i>] = [j &#8712; <i>Replica</i>&#160;&#8614; 1]]
    </p>
    <p>
      &#8743; <i>lastAgreeIndex&#8242;</i>&#160;= [<i>lastAgreeIndex</i>&#160;EXCEPT ![<i>i</i>] = [<i>j</i>&#160;&#8712; Replica &#8614; 0]]
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_1961542591" TEXT="">
<node ID="ID_1159059489">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Candidate <font face="Courier"><i>i</i></font>&#160;sends <font face="Courier"><i>j</i></font>&#160;a <font face="Courier"><i>RequestVote</i></font>&#160; request.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_502622859">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier"><i>RequestVote</i></font>(<font face="Courier"><i>i</i></font>, <font face="Courier"><i>j</i></font>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_494328789" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1713102653">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier" size="3">&#8743; <i>state</i>[<i>i</i>] = <i>Candidate</i>&#160; </font>
    </p>
    <p>
      <font face="Courier" size="3">&#8743; <i>j</i>&#160;&#8713; <i>votesResponded</i>[<i>i</i>] </font>
    </p>
    <div title="Page 5" class="page">
      <div class="layoutArea">
        <div class="column">
          <p>
            <font face="Courier">&#8743; <i>Send</i>([<i>mtype</i>&#160;&#160;&#8614;&#160;<i>RequestVoteRequest</i>, </font>
          </p>
          <p>
            <font face="Courier">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mterm</i>&#160;&#160;&#8614;&#160;<i>currentTerm</i>[</font><font size="3" face="Courier"><i>i</i></font><font face="Courier">],<br size="3" face="Courier" />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mlastLogTerm</i>&#160; &#8614;&#160;<i>LastTerm</i>(<i>log</i>[</font><font size="3" face="Courier"><i>i</i></font><font face="Courier">]),<br size="3" face="Courier" />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mlastLogIndex</i>&#160; &#8614;&#160;<i>Len</i>(<i>log</i>[</font><font size="3" face="Courier"><i>i</i></font><font face="Courier">]), </font>
          </p>
        </div>
      </div>
      <div class="layoutArea">
        <div class="column">
          <p>
            <font face="Courier">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>msource</i>&#160;&#160;&#8614;&#160;</font><font size="3" face="Courier"><i>i</i></font><font face="Courier">,<br size="3" face="Courier" />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mdest</i>&#160; &#8614; <i>j</i>]) </font>
          </p>
        </div>
      </div>
      <div class="layoutArea">
        <div class="column">
          <p>
            <font face="Courier">&#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217; </font>
          </p>
        </div>
      </div>
    </div>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_278199788" TEXT="">
<node ID="ID_51966976" TEXT="">
<node ID="ID_242861947">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Leader <font face="Courier"><i>i</i></font>&#160;sends <font face="Courier"><i>j</i></font>&#160;an <font face="Courier"><i>AppendEntries</i></font>&#160; request containing up to 1 entry.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1765684446" TEXT="While implementations may want to send more than 1 at a time, this spec uses just 1 because it minimizes atomic regions without loss of generality."/>
</node>
<node ID="ID_872370499">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier"><i>AppendEntries</i></font>(<font face="Courier"><i>i</i></font>, <font face="Courier"><i>j</i></font>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_252761541" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1046602923">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>i</i>&#160;&#8800; <i>j</i>&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_265265808">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>state</i>[<i>i</i>] = <i>Leader</i>&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1841781921">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; LET
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_261846368">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>prevLogIndex</i>&#160;&#8796; <i>nextIndex</i>&#160;[<i>i</i>][<i>j</i>] &#8722; 1
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_599374568">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>prevLogTerm</i>&#160;&#8796; IF <i>prevLogIndex</i>&#160;&gt; 0 THEN <i>log</i>[<i>i</i>][<i>prevLogIndex</i>].<i>term</i>&#160; ELSE 0&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1763097564" TEXT="">
<node ID="ID_1735515134" TEXT="Send up to 1 entry, constrained by the end of the log. ">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node ID="ID_373969466">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>lastEntry</i>&#160;= <i>Min</i>({<i>Len</i>(<i>log</i>[<i>i</i>]), <i>nextIndex</i>[<i>i</i>][<i>j</i>] + 1})
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_940859338">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>entries</i>&#160;&#8796; <i>SubSeq</i>(<i>log</i>[<i>i</i>], <i>nextIndex</i>[<i>i</i>][<i>j</i>], <i>upper</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_1905012071">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      IN <i>Send</i>&#160;([<i>mtype</i>&#160;&#8614; <i>AppendEntriesRequest</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mterm</i>&#160;&#8614; <i>currentTerm</i>[<i>i</i>],
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mprevLogIndex</i>&#160; &#8614; <i>prevLogIndex</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mprevLogTerm</i>&#160; &#8614; <i>prevLogTerm</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mentries</i>&#160; &#8614; <i>entries</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mcommitIndex</i>&#160; &#8614; <i>Min</i>({<i>commitIndex</i>[<i>i</i>], <i>lastEntry</i>}),
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>msource</i>&#160; &#8614; <i>i</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mdest</i>&#160;&#8614; <i>j</i>])
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_107775348">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_200286097" TEXT="">
<node ID="ID_1660201520">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Candidate <font face="Courier"><i>i</i></font>&#160;transitions to leader.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1661425616">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier"><i>BecomeLeader</i>(<i>i</i>)</font>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1344378057" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1235330805">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>state</i>[<i>i</i>] = <i>Candidate</i><br />&#8743; <i>votesGranted</i>[<i>i</i>] &#8712; <i>Quorum</i><br />&#8743; <i>state&#8242;</i>&#160;= [<i>state</i>&#160;EXCEPT ![<i>i</i>] = <i>Leader</i>]<br />&#8743; <i>nextIndex&#8242; </i>= [<i>nextIndex</i>&#160; EXCEPT ![<i>i</i>] = [<i>j</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; <i>Len</i>(<i>log</i>[<i>i</i>]) + 1]]<br />&#8743; <i>lastAgreeIndex&#8242;</i>&#160;= [<i>lastAgreeIndex</i>&#160; EXCEPT ![<i>i</i>] = [<i>j</i>&#160;&#8712; <i>Replica</i>&#160;&#8614; 0]]<br />&#8743; <i>elections&#8242;</i>&#160; = <i>elections</i>&#160;&#8746;<br />&#160;&#160;{[<i>e.eterm</i>&#160;&#8614; <i>currentTerm</i>[<i>i</i>],&#160;<br />&#160;&#160;&#160;&#160;<i>e.eleader</i>&#160; &#8614; <i>i</i>,<br />&#160;&#160;&#160;&#160;<i>e.elog</i>&#160;&#8614; <i>log</i>[i],<br />&#160;&#160;&#160;&#160;<i>e.evotes</i>&#160; &#8614; <i>votesGranted</i>[<i>i</i>],<br />&#160;&#160;&#160;&#160;<i>e.evoterLog</i>&#160; &#8614; <i>voterLog</i>[<i>i</i>]]}<br />&#8743; UNCHANGED &#10216;<i>messages</i>, <i>currentTerm</i>, <i>votedFor</i>, <i>candidateVars</i>, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_1255129985" TEXT="">
<node ID="ID_1628169027">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Leader <font face="Courier"><i>i</i></font>&#160;receives a client request to add <font face="Courier"><i>v</i></font>&#160;to the <font face="Courier"><i>log</i></font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1882611779" TEXT="ClientRequest(i, v)">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_957458440" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1394911505">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>state</i>[<i>i</i>] = <i>Leader</i><br />&#8743; LET <i>entry</i>&#160;&#8796; [<i>term</i>&#160; &#8614; <i>currentTerm</i>[<i>i</i>], <i>value</i>&#160;&#8614; <i>v</i>]<br />&#160;&#160;&#160;&#160;&#160;&#160;<i>newIndex</i>&#160; &#8796; <i>Len</i>(<i>log</i>[<i>i</i>]) + 1<br />&#160;&#160;&#160;&#160;&#160;&#160;<i>newLog</i>&#160; &#8796; <i>Append</i>(<i>log</i>[<i>i</i>], <i>entry</i>)<br />&#160;&#160;IN <i>log&#8242;</i>&#160; = [<i>log</i>&#160;EXCEPT ![<i>i</i>] = <i>newLog</i>]<br />&#8743; UNCHANGED &#10216;<i>messages</i>, <i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>commitIndex</i>&#10217;<br />
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node ID="ID_370146658" TEXT="Message Handlers">
<node FOLDED="true" ID="ID_1872862708" TEXT="">
<node ID="ID_1683557833" TEXT="Message handlers"/>
<node ID="ID_781916068">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>i</i>&#160;= <i>recipient</i>,
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1175977051">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>j</i>&#160;= <i>sender</i>,
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1079862142">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>m</i>&#160;= <i>message</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node FOLDED="true" ID="ID_1502920302" TEXT="">
<node ID="ID_1891493683">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Server <font face="Courier"><i>i</i></font>&#160;receives a <font face="Courier"><i>RequestVote</i></font>&#160;request from server <font face="Courier"><i>j</i></font>&#160;with <font face="Courier"><i>m.mterm</i>&#160;&#8804; <i>currentTerm</i>[<i>i</i>]</font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_390324120">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>HandleRequestVoteRequest</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_287110709" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1095102902">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      LET <i>logIsCurrent</i>&#160;&#8796; &#8744; <i>m.mlastLogTerm</i>&#160;&gt; <i>LastTerm</i>(<i>log</i>[<i>i</i>])
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; &#8743; <i>m.mlastLogTerm</i>&#160; = <i>LastTerm</i>(<i>log</i>[<i>i</i>])
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mlastLogIndex</i>&#160; &#8805; <i>Len</i>(<i>log</i>[<i>i</i>])
    </p>
    <p>
      &#160;&#160;&#160;&#160;grant &#8796; &#8743; <i>m.mterm</i>&#160;= <i>currentTerm</i>[<i>i</i>]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>logIsCurrent</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>votedFor</i>[<i>i</i>] &#8712; {<i>Nil</i>, <i>j</i>}
    </p>
    <p>
      IN &#8743; <i>m.mterm</i>&#160;&#8804; <i>currentTerm</i>[<i>i</i>]
    </p>
    <p>
      &#160;&#160;&#160;&#8743; &#8744; <i>grant</i>&#160;&#8743; <i>votedFor&#8242;</i>&#160; = [<i>votedFor</i>&#160;EXCEPT ![<i>i</i>] = <i>j</i>]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#8744; &#172;<i>grant</i>&#160;&#8743; UNCHANGED <i>votedFor</i>
    </p>
    <p>
      &#160;&#160;&#160;&#8743; <i>Reply</i>([<i>mtype</i>&#160;&#8614; <i>RequestVoteResponse</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>mterm</i>&#160; &#8614; <i>currentTerm</i>[<i>i</i>],
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>mvoteGranted</i>&#160; &#8614; <i>grant</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>mlog</i>&#160; &#8614; <i>log</i>[<i>i</i>],
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>msource</i>&#160; &#8614; <i>i</i>,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>mdest</i>&#160; &#8614; <i>j</i>],
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>m</i>)
    </p>
    <p>
      &#8743; UNCHANGED &#10216;<i>state</i>&#160;, <i>currentTerm</i>&#160;, <i>candidateVars</i>&#160; , <i>leaderVars</i>&#160;, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1860710940" TEXT="">
<node ID="ID_817804529">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Server <font face="Courier"><i>i</i></font>&#160;receives a <font face="Courier"><i>RequestVote</i></font>&#160;response from server <font face="Courier"><i>j</i></font>&#160;&#160;with <font face="Courier"><i>m.mterm</i>&#160;= <i>currentTerm</i>[<i>i</i>]</font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_450003718">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>HandleRequestVoteResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1962986201" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1363848688">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>m.mterm</i>&#160;= <i>currentTerm</i>[<i>i</i>]<br />&#8743; <i>votesResponded&#8242;</i>&#160; = [<i>votesResponded</i>&#160;EXCEPT ![<i>i</i>] = <i>votesResponded</i>[<i>i</i>] &#8746; {<i>j</i>}]<br />&#8743; &#8744; <i>m.mvoteGranted</i>&#160;&#8743; <i>votesGranted&#8242;</i>&#160; = [<i>votesGranted</i>&#160;EXCEPT ![<i>i</i>] = <i>votesGranted</i>&#160;[<i>i</i>] &#8746; {<i>j</i>}]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>voterLog&#8242;</i>&#160; =[<i>voterLog</i>&#160;EXCEPT ![<i>i</i>][<i>j</i>] = <i>m.mlog</i>]<br />&#160;&#160;&#8744; &#172;<i>m.mvoteGranted</i>&#160; &#8743; UNCHANGED &#10216;<i>votesGranted</i>, <i>voterLog</i>&#10217;<br />&#8743; <i>Discard</i>(<i>m</i>)<br />&#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>votedFor</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1060360219" TEXT="">
<node ID="ID_156012357" TEXT="">
<node ID="ID_429521380">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Server <font face="Courier"><i>i</i></font>&#160;receives an <font face="Courier"><i>AppendEntries</i></font>&#160;request from server <font face="Courier"><i>j</i></font>&#160;with <font face="Courier"><i>m.mterm</i>&#160;&#8804; <i>currentTerm</i>[<i>i</i>]</font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1106308825">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      This just handles <font face="Courier"><i>m.entries</i></font>&#160;of length 0 or 1, but implementations could safely accept more by treating them the same as multiple independent requests of 1 entry.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node FOLDED="true" ID="ID_1879294668">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>HandleAppendEntriesRequest</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1972401016" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1499568881">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      LET <i>accept</i>&#160;&#8796; &#8743; <i>m.mterm</i>&#160;= <i>currentTerm</i>[<i>i</i>]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; &#8744; <i>m.mprevLogIndex</i>&#160;= 0<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; &#8743; <i>m.mprevLogIndex</i>&#160; &gt; 0<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mprevLogIndex</i>&#160; &#8804; <i>Len</i>(<i>log</i>[<i>i</i>])<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mprevLogTerm</i>&#160; = <i>log</i>[<i>i</i>][<i>m.mprevLogIndex</i>].<i>term</i><br />IN &#8743; <i>m.mterm</i>&#160; &#8804; <i>currentTerm</i>[<i>i</i>]<br />&#160;&#160;&#160;&#8743; &#8744; // reject request&#160;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; &#172;<i>accept</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>Reply</i>&#160; ([<i>mtype</i>&#160;&#8614; <i>AppendEntriesResponse</i>,<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mterm</i>&#160; &#8614; <i>currentTerm</i>[<i>i</i>],<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mlastAgreeIndex</i>&#160; &#8614; 0,<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>msource</i>&#160; &#8614; <i>i</i>,<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mdest</i>&#160; &#8614; <i>j</i>],<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>m</i>)<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;<br />&#160;&#160;&#160;&#160;&#160;&#8744; &#8743; <i>accept</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; LET <i>index</i>&#160; &#8796; <i>m.mprevLogIndex</i>&#160;+ 1<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;IN &#8744; // already done with request<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; &#8744; <i>m.mentries</i>&#160; = &#10216;&#10217;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; &#8743; <i>Len</i>(<i>log</i>[<i>i</i>]) &#8805; <i>index</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>log</i>[<i>i</i>][<i>index</i>].<i>term</i>&#160; = <i>m.mentries</i>[1].<i>term</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;// This could make our commitIndex decrease (for<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;// example if we process an old, duplicated request),<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;// but that doesn&#8217;t really affect anything.<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>commitIndex&#8242;</i>&#160; = [<i>commitIndex</i>&#160;EXCEPT ![<i>i</i>] = <i>m.mcommitIndex</i>]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>Reply</i>([<i>mtype</i>&#160;&#8614; <i>AppendEntriesResponse</i>,<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mterm</i>&#160; &#8614; <i>currentTerm</i>[<i>i</i>],<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mlastAgreeIndex</i>&#160; &#8614; <i>m.mprevLogIndex</i>&#160;+ <i>Len</i>(<i>m.mentries</i>),<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>msource</i>&#160; &#8614; <i>i</i>,<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>mdest</i>&#160; &#8614; j],<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>m</i>)<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; UNCHANGED &#10216;<i>logVars</i>&#10217;&#160;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; // conflict: remove 1 entry<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mentries</i>&#160; &#8800; &#10216;&#10217;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>Len</i>(<i>log</i>[<i>i</i>]) &#8805; <i>index</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>log</i>[<i>i</i>][<i>index</i>].<i>term</i>&#160; &#8800; <i>m.mentries</i>[1].<i>term</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; LET <i>new</i>&#160; &#8796; [<i>index2</i>&#160;&#8712; 1 .. (<i>Len</i>(<i>log</i>[<i>i</i>])&#8722;1) &#8614; <i>log</i>[<i>i</i>][<i>index2</i>]]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;IN <i>log&#8242;</i>&#160;= [<i>log</i>&#160;EXCEPT ![<i>i</i>] = <i>new</i>]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; UNCHANGED &#10216;<i>commitIndex</i>, <i>messages</i>&#10217;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; // no conflict: add entry<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mentries</i>&#160; &#8800; &#10216;&#10217;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>Len</i>(<i>log</i>[<i>i</i>]) = <i>m.mprevLogIndex</i><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>log&#8242;</i>&#160; = [<i>log</i>&#160;EXCEPT ![<i>i</i>] = <i>Append</i>(<i>log</i>[<i>i</i>], <i>m.mentries</i>[1])]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; UNCHANGED &#10216;<i>commitIndex</i>, <i>messages</i>&#10217;<br />&#160;&#160;&#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>&#10217;<br />
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1041298489" TEXT="">
<node ID="ID_223766794">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Server <font face="Courier"><i>i</i></font>&#160;receives an <font face="Courier"><i>AppendEntries</i></font>&#160;response from server <font face="Courier"><i>j</i></font>&#160;with <font face="Courier"><i>m.mterm</i>&#160;= <i>currentTerm</i>[<i>i</i>]</font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_630210833">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>HandleAppendEntriesResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1474202488" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1871035924">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>m.mterm</i>&#160;= <i>currentTerm</i>[<i>i</i>]<br />&#8743; &#8744; &#8743; <i>m.mlastAgreeIndex</i>&#160; &gt; 0<br />&#160;&#160;&#160;&#160;&#8743; <i>nextIndex&#8242;</i>&#160;= [<i>nextIndex</i>&#160; EXCEPT ! [<i>i</i>][<i>j</i>] = <i>m.mlastAgreeIndex</i>&#160;+ 1]&#160;<br />&#160;&#160;&#160;&#160;&#8743; <i>lastAgreeIndex&#8242;</i>&#160;=[<i>lastAgreeIndex</i>&#160;EXCEPT ![<i>i</i>][<i>j</i>] = <i>m.mlastAgreeIndex</i>]<br />&#160;&#160;&#160;&#160;&#8743; LET // <i>Agree</i>(<i>index</i>) is the set of replicas that agree up through index.<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>Agree</i>(<i>index</i>) &#8796; {<i>i</i>} &#8746; {<i>k</i>&#160;&#8712; <i>Replica</i>&#160;: <i>lastAgreeIndex&#8242;</i>[<i>i</i>][<i>k</i>] &#8805; <i>index</i>}<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;// The set of indexes for which a quorum agrees<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>agreeIndexes</i>&#160; &#8796; {<i>index</i>&#160;&#8712; 1 .. <i>Len</i>(<i>log</i>[<i>i</i>]) : <i>Agree</i>(<i>index</i>) &#8712; <i>Quorum</i>}<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;// New value for commitIndex&#8242;[<i>i</i>]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>newCommitIndex</i>&#160; &#8796; IF &#8743; <i>agreeIndexes</i>&#160;&#8800; {}<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>log</i>[<i>i</i>][<i>Max</i>(<i>agreeIndexes</i>)].<i>term</i>&#160;= <i>currentTerm</i>[<i>i</i>]<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;THEN<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>Max</i>(<i>agreeIndexes</i>)<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ELSE<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>commitIndex</i>[<i>i</i>]<br />&#160;&#160;&#160;&#160;IN <i>commitIndex&#8242;</i>&#160;= [<i>commitIndex</i>&#160;EXCEPT ![<i>i</i>] = <i>newCommitIndex</i>]<br />&#160;&#160;&#8744; &#8743; <i>m.mlastAgreeIndex</i>&#160;= 0<br />&#160;&#160;&#160;&#160;&#8743; <i>nextIndex&#8242;</i>&#160; = [<i>nextIndex</i>&#160;EXCEPT ! [<i>i</i>][<i>j</i>] = <i>Max</i>({<i>nextIndex</i>&#160; [<i>i</i>][<i>j</i>] &#8722; 1, 1})]&#160;<br />&#160;&#160;&#160;&#160;&#8743; UNCHANGED &#10216;<i>lastAgreeIndex</i>, <i>commitIndex</i>&#10217;<br />&#8743; <i>Discard</i>(<i>m</i>)<br />&#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>log</i>, <i>elections</i>&#10217;<br />
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_501549027" TEXT="">
<node ID="ID_329466481">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Any <i>RPC</i>&#160;with a newer term causes the recipient to advance its term first.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1417798142">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>UpdateTerm</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1338358663" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_594938599">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>m.mterm</i>&#160;&gt; <i>currentTerm</i>[<i>i</i>]
    </p>
    <p>
      &#8743; <i>currentTerm&#8242;</i>&#160;= [<i>currentTerm</i>&#160;EXCEPT ![<i>i</i>] = <i>m.mterm</i>]
    </p>
    <p>
      &#8743; <i>state&#8242;</i>&#160;= [<i>state</i>&#160;EXCEPT ![<i>i</i>] = <i>Follower</i>]
    </p>
    <p>
      &#8743; <i>votedFor&#8242;</i>&#160;= [<i>votedFor</i>&#160;EXCEPT ![<i>i</i>] = <i>Nil</i>]
    </p>
    <p>
      messages is unchanged so m can be processed further.
    </p>
    <p>
      &#8743; UNCHANGED &#10216;<i>messages</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_742225587" TEXT="">
<node ID="ID_420403881" TEXT="Responses with stale terms are ignored."/>
<node ID="ID_1729391261">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>DropStaleResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1755595568" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1519271445">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>m.mterm</i>&#160;&lt; <i>currentTerm</i>[<i>i</i>]
    </p>
    <p>
      &#8743; <i>Discard</i>(<i>m</i>)
    </p>
    <p>
      &#8743; UNCHANGED &#10216;<i>replicaVars</i>, <i>candidateVars</i>, <i>leaderVars</i>, <i>logVars</i>&#10217;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1203891415" TEXT="">
<node ID="ID_1587023723" TEXT="Receive a message."/>
<node ID="ID_1465118817" TEXT="Receive">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_818670096" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_993442173">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8707; <i>m</i>&#160;&#8712; DOMAIN <i>messages</i>&#160;:<br />&#160;&#160;LET <i>i</i>&#160; &#8796; <i>m.mdest</i><br />&#160;&#160;&#160;&#160;&#160;&#160;<i>j</i>&#160;&#160;&#8796; <i>m.msource</i><br />&#160;&#160;IN<br />Any <i>RPC</i>&#160;with a newer term causes the recipient to advance its term first.<br />Responses with stale terms are ignored.<br />&#160;&#160;&#160;&#160;&#8744; <i>UpdateTerm</i>(<i>i</i>, j, m)<br />&#160;&#160;&#160;&#160;&#8744; <i>m.mtype</i>&#160;&#160;= <i>RequestVoteRequest</i>&#160;&#160;&#160;&#160;&#8743; <i>HandleRequestVoteRequest</i>(<i>i</i>, <i>j</i>, <i>m</i>)<br />&#160;&#160;&#160;&#160;&#8744; <i>m.mtype</i>&#160; = <i>RequestVoteResponse</i>&#160;&#160;&#160;&#8743; &#8744; <i>DropStaleResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; <i>HandleRequestVoteResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)<br />&#160;&#160;&#160;&#160;&#8744; <i>m.mtype</i>&#160;&#160;= <i>AppendEntriesRequest</i>&#160;&#160;&#8743; <i>HandleAppendEntriesRequest</i>(<i>i</i>, <i>j</i>, <i>m</i>)<br />&#160;&#160;&#160;&#160;&#8744; <i>m.mtype</i>&#160; = <i>AppendEntriesResponse</i>&#160;&#8743; &#8744; <i>DropStaleResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8744; <i>HandleAppendEntriesResponse</i>(<i>i</i>, <i>j</i>, <i>m</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node ID="ID_1372201316" TEXT="End of message handlers"/>
</node>
<node FOLDED="true" ID="ID_1495734610" TEXT="Variable Transitions">
<node ID="ID_1954670731" TEXT="">
<node ID="ID_1656587161" TEXT="Defines how the variables may transition."/>
<node ID="ID_1321336344">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Next</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1546180515" TEXT="&#x225c;">
<node ID="ID_1009960060" TEXT="&#x2227;">
<node ID="ID_469911369">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; <i>DuplicateMessage</i>&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1472437625">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; <i>DropMessage</i>&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_129239543">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; <i>Receive</i>&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1947287419">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; &#8707; <i>i</i>&#160;&#8712; <i>Replica</i>&#160;: <i>Timeout</i>(<i>i</i>)&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1295856543">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; &#8707; <i>i</i>&#160;&#8712; <i>Replica</i>&#160;: <i>Restart</i>(<i>i</i>)&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1790024046">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; &#8707; <i>i</i>&#160;&#8712; <i>Replica</i>&#160;: <i>BecomeLeader</i>(<i>i</i>)&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_426545119">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; &#8707; <i>i</i>&#160;&#8712; <i>Replica</i>, <i>v</i>&#160;&#8712; <i>Value</i>&#160; : <i>ClientRequest</i>(<i>i</i>, <i>v</i>)&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_1279974485">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; &#8707; <i>i</i>,<i>j</i>&#160;&#8712; <i>Replica</i>&#160;: <i>RequestVote</i>(<i>i</i>, <i>j</i>)&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
<node ID="ID_944984861">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8744; &#8707; <i>i</i>,<i>j</i>&#160;&#8712; <i>Replica</i>&#160;: <i>AppendEntries</i>(<i>i</i>, <i>j</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node ID="ID_349823999" TEXT="">
<node ID="ID_1586078171">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      History variable that tracks every <font face="Courier"><i>log</i></font>&#160;ever:
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_796462900">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#8743; <i>allLogs&#8242;</i>&#160;= <i>allLogs</i>&#160;&#8746; {&#8704; <i>i</i>&#160; &#8712; <i>Replica</i>&#160;: <i>log</i>[<i>i</i>]}
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node ID="ID_1928701991" TEXT="">
<node ID="ID_437580601">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      The specification must start with the initial state and transition according to <font face="Courier"><i>Next</i></font>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_205795713">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Spec</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_689996009" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_1728920004">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>Init</i>&#160;&#8743; &#9723;[<i>Next</i>]<font size="1">vars</font>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_682809114" TEXT="5 Definitions">
<node FOLDED="true" ID="ID_1753543792">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b>Definition 1</b>
    </p>
  </body>
</html></richcontent>
<node ID="ID_1633352194">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      An entry <font face="Courier">&#10216;<i>index</i>&#160;, <i>term</i>&#10217;</font>&#160;is <b>committed at term</b>&#160;<font face="Courier"><i>t</i></font>&#160;if it is present in every leader&#8217;s log following <font face="Courier"><i>t</i></font>:&#160;
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1483662200">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier"><i>committed</i></font>(<font face="Courier"><i>t</i></font>)
    </p>
  </body>
</html></richcontent>
<node ID="ID_1585876322" TEXT="&#x225c;">
<font NAME="Courier" SIZE="12"/>
<node ID="ID_506403151">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      {&#10216;<i>index</i>, <i>term</i>&#10217; :
    </p>
    <p>
      &#160;&#160;&#8704; <i>election</i>&#160;&#8712; <i>elections</i>&#160;:
    </p>
    <p>
      &#160;&#160;&#160;&#160;<i>election.term</i>&#160;&gt; <i>t</i>&#160;&#8658;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#10216;<i>index</i>, <i>term</i>&#10217; &#8712; <i>election.log</i>}
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_863032880">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b>Definition 2</b>
    </p>
  </body>
</html></richcontent>
<node ID="ID_1182995827" TEXT="">
<node ID="ID_629648643">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      An entry <font face="Courier">&#10216;<i>index</i>, <i>term</i>&#10217;</font>&#160;is <b>immediately committed</b>&#160;if it is acknowledged by a quorum (including the leader) during <font face="Courier"><i>term</i></font>.&#160;
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1630569762">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Theorem 9 shows that these entries are <b>committed at term</b>.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_1913022700">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>immediatelyCommitted</i>
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_166687901" TEXT="&#x225c;">
<node ID="ID_554743491">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      {&#10216;<i>index</i>, <i>term</i>&#10217; :
    </p>
    <p>
      &#160;&#160;&#8707; <i>leader</i>,<i>subquorum</i>&#160;:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#8743; <i>subquorum</i>&#160;&#8746; {<i>leader</i>} &#8712; <i>Quorum</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#8743; &#8704; <i>i</i>&#160;&#8712; <i>subquorum</i>&#160; :
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#8707; <i>m</i>&#160;&#8712; <i>messages</i>&#160; :
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.msource</i>&#160;= <i>i</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mdest</i>&#160;= <i>leader</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mtype</i>&#160;= <i>AppendEntriesResponse</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mterm</i>&#160;= <i>term</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>m.mlastAgreeIndex</i>&#160; &#8805; <i>index</i>}&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_338874988">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b>Definition 3</b>
    </p>
  </body>
</html></richcontent>
<node ID="ID_432019827" TEXT="">
<node ID="ID_897379875">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      An entry <font face="Courier">&#10216;<i>index</i>, <i>term</i>&#10217;</font>&#160;is <b>prefix committed&#160;at term</b>&#160;<font face="Courier"><i>t</i></font>&#160;if there is another entry that is <b>committed at term</b>&#160;<font face="Courier"><i>t</i></font>&#160;following it in some log.&#160;
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_656963351">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Theorem 10 shows that these entries are <b>committed at term</b>&#160;<font face="Courier"><i>t</i></font>.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node ID="ID_1128657581">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <i>prefixCommitted</i>(<i>t</i>)
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
<node ID="ID_895819563" TEXT="&#x225c;">
<node ID="ID_598944418">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      {&#10216;<i>index</i>, <i>term</i>&#10217; :
    </p>
    <p>
      &#160;&#160;&#8707; <i>i</i>&#160;&#8712; <i>Server</i>&#160;:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#8743; &#10216;<i>index</i>, <i>term</i>&#10217; &#8712; <i>log</i>[<i>i</i>]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#8743; &#8707; &#10216;<i>rindex</i>, <i>rterm</i>&#10217; &#8712; <i>log</i>[<i>i</i>] :
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#8743; <i>index</i>&#160;&lt; <i>rindex</i>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#8743; &#10216;<i>rindex</i>, <i>rterm</i>&#10217; &#8712; <i>committed</i>(<i>t</i>)}&#160;&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_407231190" TEXT="6 Proof">
<node ID="ID_207241346" TEXT="See paper."/>
</node>
</node>
<node FOLDED="true" ID="ID_1015469484" LINK="http://ramcloud.stanford.edu/raft.pdf" TEXT="In Search of an Understandable Consensus Algorithm">
<node FOLDED="true" ID="ID_1564889603" TEXT="Header">
<node ID="ID_259723468" TEXT="Stanford University">
<node ID="ID_590073717" TEXT="Diego Ongaro"/>
<node ID="ID_1976037720" TEXT="John Ousterhout"/>
</node>
<node ID="ID_333974319" TEXT="Draft of February 22, 2014"/>
</node>
<node FOLDED="true" ID="ID_706971825" TEXT="Abstract">
<node ID="ID_543085333" TEXT="Raft is a consensus algorithm for managing a replicated log."/>
<node ID="ID_306559717" TEXT="Results equivalent to Paxos, ">
<node ID="ID_1849935535" TEXT="just as efficient, "/>
<node ID="ID_383798723" TEXT="but different structure."/>
</node>
<node ID="ID_1347611779" TEXT="Easier to understand then Paxos.">
<node ID="ID_930345959" TEXT="3 separate elements of consensus">
<node ID="ID_1325443740" TEXT="leader election"/>
<node ID="ID_1585694949" TEXT="log replication"/>
<node ID="ID_292971639" TEXT="safety"/>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_946521873" TEXT="1 Introduction">
<node ID="ID_55484654" TEXT="&#xb6;">
<node ID="ID_442729209" TEXT="Consensus algorithms allow a collection of machines to work as a coherent group that can survive the failures of some of its members."/>
<node ID="ID_1336785372" TEXT="They play a key role in building reliable large-scale software systems."/>
<node ID="ID_520807838" TEXT="Paxos has dominated the discussion."/>
</node>
<node ID="ID_870435826" TEXT="&#xb6;">
<node ID="ID_401101076" TEXT="Paxos is hard to understand."/>
<node ID="ID_1150512930" TEXT="Architecture unsuitable for building practical systems."/>
</node>
<node ID="ID_324851070" TEXT="&#xb6;">
<node ID="ID_351817064">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Raft was designed for <i>understandibility</i>.
    </p>
  </body>
</html></richcontent>
</node>
<node ID="ID_1397278848" TEXT="The algorithm needed to be complete enough to cover all the major issues required for an implementation"/>
</node>
<node ID="ID_1734857273" TEXT="&#xb6;">
<node ID="ID_365862107" TEXT="The result is a consensus algorithm called Raft."/>
<node ID="ID_1989776596" TEXT="To increase understanding built using">
<node ID="ID_1036614554" TEXT="decomposition">
<node ID="ID_193806503" TEXT="leader election, "/>
<node ID="ID_1879639659" TEXT="log replication, "/>
<node ID="ID_485415245" TEXT="and safety"/>
</node>
<node ID="ID_1354540223" TEXT="state space reduction"/>
</node>
<node ID="ID_1627496916" TEXT="Students found Raft easier to learn then Paxos"/>
</node>
<node ID="ID_1568173416" TEXT="&#xb6;">
<node ID="ID_1597592340" TEXT="Raft has several novel features">
<node ID="ID_654976064" TEXT="Strong leader">
<node ID="ID_599832359" TEXT="Log entries only flow from the leader to other servers"/>
</node>
<node ID="ID_1075438007" TEXT="Leader election">
<node ID="ID_520796468" TEXT="Raft uses randomized timers to elect leaders."/>
</node>
<node ID="ID_866802387" TEXT="Membership changes">
<node ID="ID_1321496383" TEXT="Joint consensus approach to configuration changes."/>
</node>
</node>
</node>
<node ID="ID_776581069" TEXT="&#xb6;">
<node ID="ID_1139838453" TEXT="Authors believe Raft is superior to Paxos because">
<node ID="ID_1238832290" TEXT="It is simpler and more understandable than other algorithms."/>
<node ID="ID_26834242" TEXT="it is described completely enough to meet the needs of a practical system"/>
<node ID="ID_180568696" TEXT="it has several open-source implementations and is used by several companies"/>
<node ID="ID_1612025296" TEXT="its safety properties have been formally specified and proven"/>
<node ID="ID_222309683" TEXT="and its efficiency is comparable to other algorithms"/>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_8236846" TEXT="2 Achieving fault-tolerance with replicated state machines">
<node FOLDED="true" ID="ID_220437491" TEXT="&#xb6;">
<node ID="ID_1394911109" LINK="#ID_1504878464" TEXT="Consensus algorithms typically arise in the context of replicated state machines [35]."/>
<node ID="ID_508419448" TEXT="State machines on a collection of servers ">
<node ID="ID_1404815693" TEXT="compute identical copies of the same state"/>
<node ID="ID_1481874913" TEXT=" and can continue operating even if some of the servers are down."/>
</node>
<node ID="ID_801106509" TEXT="Examples include">
<node ID="ID_1406819386" TEXT=" manage leader election "/>
<node ID="ID_167563240" TEXT="and store configuration information that must survive leader crashes."/>
</node>
</node>
<node FOLDED="true" ID="ID_968518347" TEXT="&#xb6;">
<node ID="ID_195193928" TEXT="Replicated state machines are typically implemented using a replicated log,"/>
<node ID="ID_42338616" TEXT="Each server ">
<node ID="ID_429442987" TEXT="stores a log containing a series of commands, "/>
<node ID="ID_299381009" TEXT="which its state machine executes in order."/>
</node>
<node ID="ID_907423876" TEXT="Each log contains ">
<node ID="ID_824022991" TEXT="the same commands in the same order, "/>
<node ID="ID_672116752" TEXT="so each state machine processes the same sequence of commands."/>
</node>
<node ID="ID_639891350" TEXT="Since the state machines are deterministic, each computes ">
<node ID="ID_1793156142" TEXT="the same state "/>
<node ID="ID_804933263" TEXT="and the same sequence of outputs."/>
</node>
</node>
<node FOLDED="true" ID="ID_1906437663" TEXT="&#xb6;">
<node ID="ID_1831098179" TEXT="Keeping the replicated log consistent is the job of the consensus algorithm."/>
<node ID="ID_610673671" TEXT="The consensus module on a server ">
<node ID="ID_966111150" TEXT="receives commands from clients "/>
<node ID="ID_1475989604" TEXT="and adds them to its log. "/>
</node>
<node ID="ID_1651970143" TEXT="It communicates with the consensus modules on other servers">
<node ID="ID_284745146" TEXT="to ensure that every log ">
<node ID="ID_914891618" TEXT="eventually contains the same requests "/>
<node ID="ID_248420652" TEXT="in the same order, "/>
</node>
<node ID="ID_1761224123" TEXT="even if some servers fail. "/>
</node>
<node ID="ID_277033964" TEXT="Once commands are properly replicated, ">
<node ID="ID_354863428" TEXT="each server&#x2019;s state machine ">
<node ID="ID_573292480" TEXT="processes them in log order, "/>
</node>
<node ID="ID_31687902" TEXT="and the outputs are returned to clients."/>
</node>
<node ID="ID_1864215792" TEXT="As a result, the servers appear to form a ">
<node ID="ID_1209314330" TEXT="single, "/>
<node ID="ID_787385617" TEXT="highly-reliable "/>
<node ID="ID_268247265" TEXT="state machine."/>
</node>
</node>
<node FOLDED="true" ID="ID_210188467" TEXT="&#xb6;">
<node ID="ID_1576457874" TEXT="Practical Consensus algorithms have the following properties:"/>
<node ID="ID_583685331" TEXT="">
<node ID="ID_1309146842" TEXT="&#x2022;">
<node ID="ID_1330801466" TEXT="They ensure ">
<node ID="ID_715520222" TEXT="safety ">
<node ID="ID_776184121" TEXT="(never returning an incorrect result)"/>
</node>
<node ID="ID_1594075716" TEXT=" under all non-Byzantine conditions, including ">
<node ID="ID_1891813105" TEXT="network delays, "/>
<node ID="ID_1033331430" TEXT="partitions, "/>
<node ID="ID_213129799" TEXT="and packet loss, "/>
<node ID="ID_255953184" TEXT="duplication, "/>
<node ID="ID_1938220873" TEXT="and reordering"/>
</node>
</node>
</node>
<node ID="ID_1903926278" TEXT="&#x2022;">
<node ID="ID_1208195523">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      They are fully functional (<i>available</i>) as long as&#160;
    </p>
  </body>
</html></richcontent>
<node ID="ID_1178043091" TEXT="any majority of the servers are operational "/>
<node ID="ID_1395779203" TEXT="and can communicate with ">
<node ID="ID_845097486" TEXT="each other "/>
<node ID="ID_168774828" TEXT="and with clients. "/>
</node>
</node>
<node ID="ID_319432465" TEXT="Thus, a typical cluster of five servers can tolerate the failure of any two servers. "/>
<node ID="ID_899716286" TEXT="Servers are assumed to fail by stopping; ">
<node ID="ID_656795693" TEXT="they may later recover from state on stable storage and rejoin the cluster."/>
</node>
</node>
<node ID="ID_1743220223" TEXT="&#x2022;">
<node ID="ID_1569545959" TEXT="They do not depend on timing to ensure the consistency of the logs: ">
<node ID="ID_984015296" TEXT="faulty clocks and extreme message delays can, at worst, cause availability problems."/>
</node>
</node>
<node ID="ID_14822118" TEXT="&#x2022;">
<node ID="ID_338389154" TEXT="In the common case, a command can complete as soon as any majority of the cluster has responded to a single round of remote procedure calls; "/>
<node ID="ID_261072383" TEXT="a minority of slow servers need not impact overall system performance."/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1340288178" TEXT="3 What&apos;s wrong with Paxos?">
<node ID="ID_1150710883" TEXT="See paper."/>
</node>
<node ID="ID_334581309" TEXT="4 Designing for understandability">
<node ID="ID_1852731294" TEXT="&#xb6;">
<node ID="ID_893286759" TEXT="We had several goals in designing Raft: it must provide a complete and appropriate foundation for system building, so that it significantly reduces the amount of design work required of developers; it must be safe under all con- ditions and available under typical operating conditions; and it must be efficient for common operations. But our most important goal&#x2014;and most difficult challenge&#x2014;was understandability. It must be possible for a large audience to understand the algorithm comfortably. In addition, it must be possible to develop intuitions about the algorithm, so that system builders can make the extensions that are inevitable in real-world implementations."/>
</node>
<node ID="ID_1189769422" TEXT="&#xb6;">
<node ID="ID_901868408" TEXT="There were numerous points in the design of Raft where we had to choose among alternative approaches. In these situations we evaluated the alternatives based on understandability: how hard is it to explain each alterna- tive (for example, how complex is its state space, and does it have subtle implications?), and how easy will it be for a reader to completely understand the approach and its implications? Given a choice between an alternative that was concise but subtle and one that was longer (either in lines of code or explanation) but more obvious, we chose the more obvious approach. Fortunately, in most cases the more obvious approach was also more concise."/>
</node>
<node ID="ID_697177773" TEXT="&#xb6;">
<node ID="ID_1895354065" TEXT="We recognize that there is a high degree of subjectiv- ity in such analysis; nonetheless, we used two techniques that are generally applicable. The first technique is the well-known approach of problem decomposition: wher- ever possible, we divided problems into separate pieces that could be solved, explained, and understood relatively independently. For example, in Raft we separated leader election, log replication, safety, and membership changes."/>
</node>
<node ID="ID_1718817530" TEXT="&#xb6;">
<node ID="ID_1608144443" TEXT="Our second approach was to simplify the state space by reducing the number of states to consider, making the system more coherent and eliminating nondeterminism where possible. For example, logs are not allowed to have holes, and Raft limits the ways in which logs can become inconsistent with each other. This approach conflicts with advice given by Lampson: &#x201c;More nondeterminism is bet- ter, because it allows more implementations [19].&#x201d; In our situation we needed only a single implementation, but it needed to be understandable; we found that reducing non- determinism usually improved understandability. We sus- pect that trading off implementation flexibility for under- standability makes sense for most system designs."/>
</node>
</node>
<node FOLDED="true" ID="ID_1171800251" TEXT="5 The Raft consensus algorithm">
<node ID="ID_406250072" TEXT="5.1 Raft basics"/>
<node ID="ID_1973533456" TEXT="5.2 Leader election"/>
<node ID="ID_1343356990" TEXT="5.3 Log replication"/>
<node ID="ID_791042235" TEXT="5.4 Safety">
<node ID="ID_783532196" TEXT="5.4.1 Election restriction"/>
<node ID="ID_1367676349" TEXT="5.4.2 Restriction on commitment"/>
<node ID="ID_562441640" TEXT="5.4.3 Safety argument"/>
</node>
<node ID="ID_853855077" TEXT="5.5 Follower and candidate crashes"/>
<node ID="ID_254829734" TEXT="5.6 Timing and availability"/>
</node>
<node ID="ID_641364780" TEXT="6 Cluster membership changes"/>
<node ID="ID_100937005" TEXT="7 Log compaction"/>
<node ID="ID_598218600" TEXT="8 Client interaction"/>
<node FOLDED="true" ID="ID_156049987" TEXT="9 Implementation and evaluation">
<node ID="ID_849901843" TEXT="9.1 Understandability"/>
<node ID="ID_500820697" TEXT="9.2 Correctness"/>
<node ID="ID_788755064" TEXT="9.3 Performance"/>
</node>
<node ID="ID_759175273" TEXT="10 Related work"/>
<node ID="ID_164771302" TEXT="11 Conclusion"/>
<node ID="ID_323639683" TEXT="12 Acknowledgments"/>
<node FOLDED="true" ID="ID_664663742" TEXT="References">
<node FOLDED="true" ID="ID_1619224233" TEXT="[35]">
<node ID="ID_1504878464" LINK="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;cad=rja&amp;uact=8&amp;ved=0CCYQFjAA&amp;url=https%3A%2F%2Fwww.cs.cornell.edu%2Ffbs%2Fpublications%2FSMSurvey.pdf&amp;ei=1clfU7CFAsWeyASF2YDADA&amp;usg=AFQjCNH00Pgd0mGFO_35etaQu19sAVB23A&amp;bvm=bv.65636070,d.aWw" TEXT="SCHNEIDER, F. B. Implementing fault-tolerant services using the state machine approach: a tutorial. ACM Comput. Surv. 22, 4 (Dec. 1990), 299&#x2013;319."/>
</node>
</node>
</node>
</node>
<node FOLDED="true" ID="ID_1834959607" POSITION="left" TEXT="Links">
<node ID="ID_1563303256" LINK="http://raftconsensus.github.io/" TEXT="The Raft Consensus Algorithm"/>
</node>
</node>
</map>
