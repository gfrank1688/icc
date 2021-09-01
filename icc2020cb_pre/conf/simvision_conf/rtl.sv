# SimVision Command Script (三  九  01 十二時廿一分六秒 CST 2021)
#
# Version 15.20.s084
#
# You can restore this configuration with:
#
#     simvision -input /home/nfs_home/wei/icc/icc2020cb_pre/conf/simvision_conf/rtl.sv
#


#
# Preferences
#
preferences set plugin-enable-svdatabrowser-new 1
preferences set plugin-enable-groupscope 0
preferences set plugin-enable-interleaveandcompare 0
preferences set plugin-enable-waveformfrequencyplot 0
preferences set whats-new-dont-show-at-startup 1

#
# Databases
#
database require SME -search {
	./SME.shm/SME.trn
	/home/nfs_home/wei/icc/icc2020cb_pre/build/SME.shm/SME.trn
}

#
# Mnemonic Maps
#
mmap new -reuse -name {Boolean as Logic} -radix %b -contents {{%c=FALSE -edgepriority 1 -shape low}
{%c=TRUE -edgepriority 1 -shape high}}
mmap new -reuse -name {Example Map} -radix %x -contents {{%b=11???? -bgcolor orange -label REG:%x -linecolor yellow -shape bus}
{%x=1F -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=2C -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=* -label %x -linecolor gray -shape bus}}

#
# Waveform windows
#
if {[catch {window new WaveWindow -name "Waveform 1" -geometry 1848x1016+71+26}] != ""} {
    window geometry "Waveform 1" 1848x1016+71+26
}
window target "Waveform 1" on
waveform using {Waveform 1}
waveform sidebar select designbrowser
waveform set \
    -primarycursor TimeA \
    -signalnames name \
    -signalwidth 175 \
    -units ns \
    -valuewidth 75
waveform baseline set -time 0

set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.reset
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.clk
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.state[2:0]}
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.ispattern
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.isstring
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.chardata[7:0]}
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.str_len[5:0]}
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.str[0:39]}
	} ]
waveform hierarchy collapse $id
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.pat_len[3:0]}
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.pat[0:8]}
	} ]
waveform hierarchy expand $id
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.m_state[2:0]}
	} ]
waveform format $id -radix %d -color #00ffff
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.pat_itr[6:0]}
	} ]
waveform format $id -radix %d -color #ff0000
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.str_ptr[6:0]}
	} ]
waveform format $id -radix %d -color #ff00ff
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.str_ptr_h[6:0]}
	} ]
waveform format $id -color #ff00ff
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.str_ptr_t[6:0]}
	} ]
waveform format $id -radix %d -color #ff00ff
waveform hierarchy collapse $id
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.all_match[0:8]}
	} ]
waveform hierarchy collapse $id
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.m_star
	} ]
set id [waveform add -signals  {
	SME::testfixture.allpass
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.valid
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.match_index[4:0]}
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.match
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.m_head_match
	} ]
set id [waveform add -signals  {
	SME::testfixture.u_SME.ul_dp.m_tail_match
	} ]
set id [waveform add -signals  {
	{SME::testfixture.u_SME.ul_dp.head_match_idx[6:0]}
	} ]
waveform format $id -radix %d

waveform xview limits 33760ns 34760ns

#
# Waveform Window Links
#

#
# Console windows
#
console set -windowname Console
window geometry Console 600x250+145+102

