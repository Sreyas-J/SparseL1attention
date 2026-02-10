// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Feb 10 23:13:45 2026
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.386699 mW" *) 
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
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
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
e/y+4teXbUz0XuAW8iPYEw==
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
