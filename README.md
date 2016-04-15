# CPU-Verilog

中山大学 软件工程 《计算机组成原理与接口技术》
实验一	：	单周期CPU设计

一、 实验目的
(1) 掌握单周期CPU数据通路图的构成、原理及其设计方法；
(2) 掌握单周期CPU的实现方法，代码实现方法；
(3) 认识和掌握指令与CPU的关系；
(4) 掌握测试单周期CPU的方法。

二、 实验内容
设计一个单周期CPU，该CPU至少能实现以下指令功能操作。需设计的指令与格式如下：
==> 算术运算指令
(1) ADD  rd , rs, rt  （说明：以助记符表示，是汇编指令；以代码表示，是机器指令）
000000	rs(5位)	rt(5位)	rd(5位)	reserved
功能：rd←rs+rt。reserved为预留部分，即未用，一般填“0”。

(2) SUB  rd , rs , rt
000001	rs(5位)	rt(5位)	rd(5位)	reserved
完成功能：rd←rs-rt
    ==> 逻辑运算指令

(3) ORI rt , rs ,immediate
010000	rs(5位)	rt(5位)	immediate(16位)
功能：rt←rs | (zero-extend)immediate；immediate做“0”扩展再参加“或”运算

(4) AND rd , rs , rt
010001	rs(5位)	rt(5位)	rd(5位)	reserved
功能：rd←rs & rt；逻辑与运算

(5) OR rd , rs , rt
010010	rs(5位)	rt(5位)	rd(5位)	reserved
功能：rd←rs | rt；逻辑或运算
    ==> 传送指令

(6) MOVE  rd , rs   
100000	rs(5位)	rt(5位)	rd(5位)	reserved
功能：rd←rs+$r0 ；$r0=$zero=0，助记符zero=0
==> 存储器读/写指令

(7) SW  rt ,immediate(rs) 写存储器
100110	rs(5位)	rt(5位)	immediate(16位)
    功能：memory[rs+ (sign-extend)immediate]←rt；immediate符号扩展再相加

(8) LW  rt , immediate(rs) 读存储器
100111	rs(5位)	rt(5位)	immediate(16位)
功能：rt ← memory[rs + (sign-extend)immediate]；immediate符号扩展再相加
 ==> 分支指令

(9)BEQ  rs,rt,immediate      
110000	rs(5位)	rt(5位)	immediate(位移量，16位)
功能：if(rs=rt) PC ←PC + 4 + (sign-extend)immediate<<2；
特别说明：immediate是从PC+4地址开始和转移到的指令之间指令条数。immediate符号扩展之后左移2位再相加。为什么要左移2位？由于跳转到的指令地址肯定是4的倍数（每条指令占4个字节），最低两位是“00”，因此将immediate放进指令码中的时候，是右移了2位的，也就是以上说的“指令之间指令条数”。
==> 停机指令

(10) HALT 
111111	00000000000000000000000000(26位)
功能：停机；不改变PC的值，PC保持不变。
