// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Mar  3 16:29:20 2026
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19248)
`pragma protect data_block
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
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
