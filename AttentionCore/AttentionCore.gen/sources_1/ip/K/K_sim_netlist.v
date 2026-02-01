// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 22:58:13 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sk/Desktop/SparseL1Attention/AttentionCore/AttentionCore.gen/sources_1/ip/K/K_sim_netlist.v
// Design      : K
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "K,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module K
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [1:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [1:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
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
  (* C_INIT_FILE = "K.mem" *) 
  (* C_INIT_FILE_NAME = "K.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4" *) 
  (* C_READ_DEPTH_B = "4" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4" *) 
  (* C_WRITE_DEPTH_B = "4" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  K_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19168)
`pragma protect data_block
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
rZIcTelDJWn/LIp0QYIl2g==
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
