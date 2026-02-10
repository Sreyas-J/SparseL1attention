// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 22:58:13 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top K -prefix
//               K_ K_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18880)
`pragma protect data_block
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
/LKzj8SqWtY6l3oPGg==
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
