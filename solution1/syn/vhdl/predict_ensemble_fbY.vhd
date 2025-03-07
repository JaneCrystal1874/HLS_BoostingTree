-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fbY_rom is 
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


architecture rtl of predict_ensemble_fbY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 to 8=> "0", 9 to 11=> "1", 12 to 13=> "0", 14 => "1", 15 to 16=> "0", 
    17 => "1", 18 to 19=> "0", 20 => "1", 21 to 22=> "0", 23 => "1", 24 to 25=> "0", 26 => "1", 
    27 => "0", 28 => "1", 29 => "0", 30 => "1", 31 to 39=> "0", 40 to 43=> "1", 44 => "0", 
    45 => "1", 46 => "0", 47 => "1", 48 to 52=> "0", 53 => "1", 54 to 55=> "0", 56 => "1", 
    57 to 58=> "0", 59 to 60=> "1", 61 to 65=> "0", 66 to 70=> "1", 71 => "0", 72 => "1", 73 to 74=> "0", 
    75 to 76=> "1", 77 => "0", 78 to 83=> "1", 84 to 86=> "0", 87 => "1", 88 to 89=> "0", 90 => "1", 
    91 => "0", 92 to 93=> "1", 94 to 96=> "0", 97 => "1", 98 => "0", 99 to 104=> "1", 105 to 106=> "0", 
    107 to 108=> "1", 109 to 110=> "0", 111 to 113=> "1", 114 to 116=> "0", 117 to 121=> "1", 122 to 124=> "0", 125 => "1", 
    126 to 127=> "0", 128 to 133=> "1", 134 => "0", 135 to 136=> "1", 137 => "0", 138 to 139=> "1", 140 to 142=> "0", 
    143 to 148=> "1", 149 => "0", 150 => "1", 151 => "0", 152 to 154=> "1", 155 => "0", 156 => "1", 
    157 to 159=> "0", 160 to 161=> "1", 162 to 164=> "0", 165 to 166=> "1", 167 to 168=> "0", 169 to 171=> "1", 172 => "0", 
    173 => "1", 174 => "0", 175 to 178=> "1", 179 to 194=> "0" );

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

entity predict_ensemble_fbY is
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

architecture arch of predict_ensemble_fbY is
    component predict_ensemble_fbY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fbY_rom_U :  component predict_ensemble_fbY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


