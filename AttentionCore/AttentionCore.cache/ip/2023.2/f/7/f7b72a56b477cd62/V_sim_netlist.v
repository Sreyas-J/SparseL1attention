// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 17:47:14 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ V_sim_netlist.v
// Design      : V
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "V,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
jVTMHo4=
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
