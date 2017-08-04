var NC = [], CN = [];
NC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*()-=[]\;',./_+{}|:\"<>?".split("");
for (var i=0; i<NC.length; i++) CN[NC[i]] = i;
function Lz77Compress(input)
{
	/*LZ77压缩算法 - Hutia - JS版*/
	
	/*变量声明*/
	var p = 0; //扫描指针
	var lp = 0; //链表查询指针
	var len = input.length; //输入字符串的长度
	var output = []; //输出
	var index = ""; //索引
	var head = []; //索引头信息
	var prev = []; //位置链表
	var match_off = 0; //匹配位置的偏移量
	var match_len = 0; //发生匹配的长度
	var last_match_off = 0; //上一次匹配位置的偏移量
	var last_match_len = 0; //上一次发生匹配的长度
	var j = 0; //循环变量
	
	/*循环扫描*/
	for (p=0; p<len; p++)
	{
		index = input.substring(p, p+7); //取当前字符开始的7个字符作为索引
		
		/*链表维护*/
		prev[p] = head[index]; //当前头位置进链表
		head[index] = p; //保存现在位置进头信息
		/*匹配*/
		lp = p; //初始化链表查询指针
		match_len = 0; //初始化匹配长度
		match_off = 0; //初始化匹配位置
		if (prev[lp]) //如果链表上存在上一个匹配
		{
			/*匹配查询*/
			while (prev[lp]) //依次查看链表上的每个位置
			{
				lp = prev[lp]; //取出链表上的前一个位置到链表查询指针
				for (j=1; j<8464 && lp+j<p; j++) //寻找此位置的最长匹配，匹配长度不能超过8464 (92进制的2个字节长度)，也不能超过当前指针位置
				{
					if (input.substring(lp, lp + j) != input.substring(p, p + j)) break;
				}
				j--; //计算最长匹配
				if (j > 7 && j > match_len) //如果此匹配比已发现的匹配长
				{
					match_len = j; //记录匹配长度
					match_off = lp; //记录匹配位置
				}
			}
			
			/*匹配处理*/
			if (match_len > 7) //如果找到了符合要求的匹配
			{
				if (last_match_len != 0 && last_match_len < match_len) //如果上次匹配存在，且长度没有这次匹配的长度大
				{
					/*懒惰模式*/
					output_unmatch(input.charAt(p - 1)); //放弃上次匹配，将字符直接输出
					last_match_off = match_off; //记录此次的匹配位置
					last_match_len = match_len; //记录此次的匹配长度
				}
				else if (last_match_len != 0) //如果上次匹配存在，且长度比这次匹配的长度大
				{
					/*处理上次的懒惰模式*/
					output_match(); //输出上次的匹配
				}
				else //如果上次匹配不存在
				{
					/*懒惰模式*/
					last_match_off = match_off; //记录此次的匹配位置
					last_match_len = match_len; //记录此次的匹配长度
				}
			}
			else //如果找不到符合要求的匹配（例如匹配超出当前指针）
			{
				if (last_match_len != 0) //如果上次匹配存在
				{
					/*处理上次的懒惰模式*/
					output_match(); //输出上次的匹配
					
				}
				else
				{
					output_unmatch(input.charAt(p)); //直接输出当前的字符
				}
			}
		}
		else //如果当前不存在匹配
		{
			if (last_match_len != 0) //如果之前发生了匹配
			{
				/*处理上次的懒惰模式*/
				output_match(); //输出匹配
			}
			else
			{
				output_unmatch(input.charAt(p)); //直接输出当前的字符
			}
		}
	} //循环扫描结束
	
	/*边界处理*/
	if (last_match_len != 0) //如果之前发生了匹配
	{
		/*处理上次的懒惰模式*/
		output_match(); //输出匹配
	}
	
	/*输出*/
	return output.join("");
	
	function output_match()
	{
		output.push("`"); //输出前缀符
		output.push(N2C(last_match_off, 3)); //输出3字节偏移量
		output.push(N2C(last_match_len, 2)); //输出2字节匹配长度
		p += last_match_len - 2; //移动当前指针到匹配串的末尾（因为懒惰模式，此时 p 指向 last_match_off + 1 的位置，所以应 -2 ）
		last_match_off = 0; //清空匹配位置
		last_match_len = 0; //清空匹配长度
	}
	
	function output_unmatch(c)
	{
		output.push(c == "`" ? "``" : c); //输出未匹配的字符
	}
}
function N2C(n, len) //将 10 进制数字转换为指定长度的 92 进制字符串，高位在右
{
	var re = [];
	for (var i=0; i<len; i++)
	{
		re[i] = NC[n % 92];
		n = n / 92 | 0;
	}
	return re.join("");
}