// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 17:47:15 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sk/Desktop/SparseL1Attention/AttentionCore/AttentionCore.gen/sources_1/ip/V/V_sim_netlist.v
// Design      : V
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "V,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module V
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
  (* C_INIT_FILE = "V.mem" *) 
  (* C_INIT_FILE_NAME = "V.mif" *) 
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
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  V_blk_mem_gen_v8_4_7 U0
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
+N9wxMUPgG8HTgXPbxmHOA==
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
