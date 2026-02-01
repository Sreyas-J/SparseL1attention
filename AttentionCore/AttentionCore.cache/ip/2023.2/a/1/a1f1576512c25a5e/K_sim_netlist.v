// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 22:58:13 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ K_sim_netlist.v
// Design      : K
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "K,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19328)
`pragma protect data_block
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
48KA1So=
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
