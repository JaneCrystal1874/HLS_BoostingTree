-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_qcK_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_qcK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 to 7=> "0", 8 to 10=> "1", 11 to 13=> "0", 14 => "1", 15 to 16=> "0", 
    17 to 22=> "1", 23 to 28=> "0", 29 to 33=> "1", 34 => "0", 35 to 37=> "1", 38 to 40=> "0", 41 to 42=> "1", 
    43 to 47=> "0", 48 to 51=> "1", 52 to 62=> "0", 63 to 66=> "1", 67 to 69=> "0", 70 => "1", 71 => "0", 
    72 to 76=> "1", 77 to 80=> "0", 81 => "1", 82 to 84=> "0", 85 to 86=> "1", 87 to 89=> "0", 90 to 94=> "1", 
    95 to 98=> "0", 99 => "1", 100 => "0", 101 to 103=> "1", 104 => "0", 105 => "1", 106 => "0", 
    107 to 108=> "1", 109 to 113=> "0", 114 to 116=> "1", 117 to 121=> "0", 122 to 124=> "1", 125 to 126=> "0", 127 to 133=> "1", 
    134 => "0", 135 to 138=> "1", 139 => "0", 140 => "1", 141 to 142=> "0", 143 to 144=> "1", 145 => "0", 
    146 to 147=> "1", 148 to 150=> "0", 151 => "1", 152 => "0", 153 => "1", 154 => "0", 155 => "1", 
    156 to 160=> "0", 161 to 163=> "1", 164 => "0", 165 to 166=> "1", 167 to 169=> "0", 170 to 173=> "1", 174 => "0", 
    175 to 176=> "1", 177 => "0", 178 to 182=> "1", 183 => "0", 184 to 186=> "1", 187 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_qcK is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_qcK is
    component predict_ensemble_qcK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_qcK_rom_U :  component predict_ensemble_qcK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


