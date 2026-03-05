// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Mar  3 22:38:54 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Vi_sim_netlist.v
// Design      : Vi
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Vi,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [1:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [1:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [1:0]douta;

  wire [1:0]addra;
  wire clka;
  wire [1:0]dina;
  wire [1:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [1:0]NLW_U0_doutb_UNCONNECTED;
  wire [1:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "2" *) 
  (* C_ADDRB_WIDTH = "2" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.205164 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "Vi.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4" *) 
  (* C_READ_DEPTH_B = "4" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "2" *) 
  (* C_READ_WIDTH_B = "2" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4" *) 
  (* C_WRITE_DEPTH_B = "4" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "2" *) 
  (* C_WRITE_WIDTH_B = "2" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[1:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[1:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[1:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[1:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20704)
`pragma protect data_block
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
LSs6I7zRLXcGBdkXlg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
