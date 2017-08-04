<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>即时汇总系统</title>
<script type="text/javascript">
  // this page should never load inside of another frame
  if (top.location != self.location){
    top.location = self.location;
  }
</script>
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
</HEAD>
<FRAMESET ROWS="120,*" FRAMESPACING="0" frameborder="no" border="0">
  <FRAME name="topFrame" SRC="${base}/frame/show_top_bar.action" frameborder="0" scrolling="no" noresize="noresize" />
  <FRAMESET id="menuframe" COLS="210,*" FRAMESPACING="5" >
	<FRAME name="leftFrame" SRC="${base}/frame/show_menu.action" width="275" frameborder="0" noresize="noresize"/>
	<frameset rows="*,28">
      <frame src="${base}/frame/show_default.action" name="mainFrame" id="mainFrame" title="mainFrame" />
    </frameset>
  </FRAMESET>
</FRAMESET>
<noframes></noframes>
</HTML>
