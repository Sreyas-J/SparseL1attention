// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Mar  3 16:29:20 2026
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [0:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [0:0]addra;
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
  wire [0:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "1" *) 
  (* C_ADDRB_WIDTH = "1" *) 
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2" *) 
  (* C_READ_DEPTH_B = "2" *) 
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
  (* C_WRITE_DEPTH_A = "2" *) 
  (* C_WRITE_DEPTH_B = "2" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  V_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(1'b0),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19104)
`pragma protect data_block
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
75NSXHuVM8Nq
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
