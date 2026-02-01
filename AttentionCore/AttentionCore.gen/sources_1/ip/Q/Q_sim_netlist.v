// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 15:22:47 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top Q -prefix
//               Q_ Q_sim_netlist.v
// Design      : Q
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Q,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Q
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
  (* C_INIT_FILE = "Q.mem" *) 
  (* C_INIT_FILE_NAME = "Q.mif" *) 
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
  Q_blk_mem_gen_v8_4_7 U0
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
l9iUJTnDew+jSsYdrg==
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
